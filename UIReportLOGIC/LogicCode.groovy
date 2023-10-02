if (matchingUser) {
            result.add([
            id: matchingUser.id,
            matchingContactId: contact.id,
            originalType: 'user',
            firstName: matchingUser.firstName ?: '',
            lastName: matchingUser.lastName ?: '',
            emailAddress: matchingUser.email?.toLowerCase(),
            enrollmentStatus: calculateUserEnrollmentStatus(matchingUser),
            enrollmentSubstatus: null,
            lastLogin: matchingUser.lastLogin,
            dateInvited: matchingUser.dateCreated,
            locale: matchingUser.locale,
            lastPasswordResetRequest: matchingUser.lastPasswordResetRequest,
            title: matchingUser.title,
            twoFactorAuthEnabled: matchingUser.twoFactorAuthEnabled,
            phoneNumber: matchingUser.phoneNumber,
            roles: matchingUser.roles
            ])
          } else {
            Map enrollmentStatuses = calculateContactEnrollmentStatus(contact.invitationEligibility)
            result.add([
            id: contact.id,
            matchingUserId: null,
            originalType : 'contact',
            firstName : contact.firstName ?: '',
            lastName : contact.lastName ?: '',
            emailAddress : contact.emailAddress?.toLowerCase(),
            enrollmentStatus : enrollmentStatuses.mainStatus,
            enrollmentSubstatus : enrollmentStatuses.substatus,
            lastLogin : null,
            dateInvited: null,
            phoneNumber: contact.phoneNumber,
            role: contact.role
            ])
          }
        }
      }
  static String calculateUserEnrollmentStatus(User user) {
    String enrollmentStatus
    if(user.enabled && !user.disabledByCompanyAdmin) {
      enrollmentStatus = 'active'
    } else if(user.disabledByCompanyAdmin) {
      enrollmentStatus = 'disabled'
    } else {
      enrollmentStatus = 'invited'
    }
    return enrollmentStatus
  }
 static Map calculateContactEnrollmentStatus(InvitationEligibility status) {
    Map enrollmentStatusMap = [mainStatus: '', substatus: '']
    if(status in [InvitationEligibility.INVITABLE, InvitationEligibility.INVITABLE_MERGE]) {
      enrollmentStatusMap.mainStatus = 'ready_to_invite'
      if(status == InvitationEligibility.INVITABLE_MERGE) {
        enrollmentStatusMap.substatus = 'ALREADY_ON_NETWORK'
      } else {
        enrollmentStatusMap.substatus = null
      }
    } else if(status in [InvitationEligibility.EMAIL_MISSING, InvitationEligibility.EMAIL_INVALID]) {
      enrollmentStatusMap.mainStatus = 'needs_attention'
      enrollmentStatusMap.substatus = status.toString()
    } else if(status in [InvitationEligibility.ALREADY_INVITED_FOR_BUYER_COMPANY, InvitationEligibility.ALREADY_INVITED_FOR_SUPPLIER_COMPANY]) {
      enrollmentStatusMap.mainStatus = 'needs_attention'
      enrollmentStatusMap.substatus = 'ALREADY_ON_NETWORK'
    } else if(status == InvitationEligibility.ALREADY_INVITED_FOR_SAME_COMPANY) {
      enrollmentStatusMap.mainStatus = 'invited'
      enrollmentStatusMap.substatus = null
    }
    return enrollmentStatusMap
  }
SupplierBranchService.groovy
```
package com.taulia.appBuyer.server.services
import com.taulia.api.clientauth.ClientAuthenticationContext
import com.taulia.appBuyer.common.models.AvailableSupplierBranch
import com.taulia.appBuyer.common.models.AvailableSupplierBranches
import com.taulia.appBuyer.common.models.BusinessUnit
import com.taulia.appBuyer.common.models.MergedBranch
import com.taulia.appBuyer.common.models.SupplierBranchView
import com.taulia.appBuyer.common.models.SupplierSegment
import com.taulia.auth.core.v4.user.User
import com.taulia.company.client.v1.CompanyClient
import com.taulia.company.client.v2.CompanyClientV2
import com.taulia.company.core.v1.supplier.SupplierDetails
import com.taulia.company.core.v2.enrollment.InvitationEligibility
import com.taulia.company.core.v2.polaris.PolarisSupplierDetails
import com.taulia.company.core.v2.segment.CoreSupplierSegment
import com.taulia.company.core.v2.supplier.CoreSupplierAddress
import com.taulia.company.core.v2.supplier.CoreSupplierContact
import com.taulia.company.core.v2.supplier.SupplierBranch
import com.taulia.core.data.v1_0.SearchParameters
import com.taulia.appBuyer.common.models.SupplierBranchSegmentUpdateRequest
import groovy.transform.CompileStatic
import groovy.util.logging.Slf4j
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Service
@Slf4j
@Service
@CompileStatic
class SupplierBranchService {
 @Autowired
 CompanyClient companyClientV1
 @Autowired
 CompanyClientV2 companyClientV2
 @Autowired
 SupplierSegmentService supplierSegmentService
 @Autowired
 FinanceProgramService financeProgramService
 @Autowired
 SupplierContactService supplierContactService
 @Autowired
 SupplierUserService supplierUserService
 @Autowired
 UserManagerService userManagerService
 @Autowired
 ClientAuthenticationContext clientAuthenticationContext
 SupplierBranchView getSupplierBranchView(String supplierDetailsId) {
   boolean isSCFBuyer = financeProgramService.isSCFBuyer()
   SupplierBranch supplierBranch = companyClientV2.getSupplierBranch(supplierDetailsId)
   PolarisSupplierDetails polarisSupplierDetails = companyClientV2.getPolarisSupplierDetails(supplierDetailsId, isSCFBuyer)
   SupplierDetails supplierDetails = polarisSupplierDetails?.supplierDetails ?: companyClientV1.getSupplierDetailsById(supplierDetailsId)
   ListCoreSupplierSegment segments = supplierSegmentService.getSupplierSegmentsForSupplierBranch(supplierDetailsId)
   CoreSupplierAddress address = getSupplierMainAddress(supplierBranch.addresses)
   String buyerCompanyId = clientAuthenticationContext.clientAuthentication.companyId
   SearchParameters searchParameters = new SearchParameters(
     maxPerPage: Integer.MAX_VALUE,
     page: 0
   )
   ListSupplierDetails mergedBranches = companyClientV2.getSupplierDetailsByCompanyId(supplierBranch.supplierCompanyId, searchParameters).supplierDetails?.findAll{it.id != supplierDetails.id && it.buyerCompanyId == buyerCompanyId}
   int tauliaInvoices = 0
   tauliaInvoices += polarisSupplierDetails?.eInvPortalCountOneYear ?:0
   tauliaInvoices += polarisSupplierDetails?.eInvEfileCountOneYear ?:0
   tauliaInvoices += polarisSupplierDetails?.eInvEsendCountOneYear ?:0
   new SupplierBranchView(
     isSCFBuyer: isSCFBuyer,
     address: address ? "${address.addressLine1}, ${address.city}, ${address.region}, ${address.country}" : null,
     businessUnits: supplierBranch.relations?.collect {
       new BusinessUnit(name: it.businessUnitName, number: it.businessUnitNumber, dateCreated: it.dateCreated )
     },
     currency: 'USD',
     epOfferedEnhSpendOneYear: isSCFBuyer ? null : polarisSupplierDetails?.epOfferedEnhSpendOneYear,
     epTakenEnhSpendOneYear: isSCFBuyer ? null : polarisSupplierDetails?.epTakenEnhSpendOneYear,
     initialized: supplierBranch.dateInitialized,
     activated: supplierBranch.dateActivated,
     invited: supplierBranch.dateInvited,
     invSpendOneYear: polarisSupplierDetails?.invPaidSpendOneYear,
     invSpendOneYearEur: polarisSupplierDetails?.invPaidSpendOneYearEur,
     invSpendOneYearGbp: polarisSupplierDetails?.invPaidSpendOneYearGbp,
     invSpendOneYearCan: polarisSupplierDetails?.invPaidSpendOneYearCan,
     invSpendOneYearAus: polarisSupplierDetails?.invPaidSpendOneYearAus,
     invSpendOneYearLocal: polarisSupplierDetails?.invPaidSpendOneYearLocal,
     invCountOneYear: polarisSupplierDetails?.invCountOneYear ?: 0,
     mergedBranches: mergedBranches?.collect{ new MergedBranch(id: it.id, name: it.name, number: it.number) },
     name: supplierDetails?.name,
     phone: address?.phone,
     segments: segments?.collect { [id: it.id, name: it.name] as Map },
     status: supplierBranch.enrollmentStatus,
     supplierNumber: supplierBranch.number,
     supplierCompanyId: supplierBranch.supplierCompanyId,
     tauliaInvoices: tauliaInvoices,
     is2faRequired: supplierBranch.is2faRequired,
     contacts: getCombinedContactsAndUserList(supplierDetailsId, supplierBranch.supplierCompanyId)
   )
 }
 /*
 * Creates a list of both contacts for consumption by the UI.
 * Simplifies the enrollmentStatus for contacts to three statuses: 'needs_attention', 'ready_to_invite', and 'invited'
 * The original, more detailed status is retained as enrollmentSubstatus
 * Where there is a corresponding User with the same email address, the User data will be displayed instead of the contact.
 * Users will not have a substatus.
 * */
 List getCombinedContactsAndUserList(String supplierBranchId, String companyId) {
   def result = []
   try {
     ListCoreSupplierContact contacts = supplierContactService.getSupplierContacts(supplierBranchId)
     ListUser users = supplierUserService.findAllUsersForSupplierCompany(companyId)
     boolean userListNotEmpty = users && !users.isEmpty()
     if(contacts && !contacts.isEmpty()) {
       contacts.each { CoreSupplierContact contact ->
         User matchingUser
         if(userListNotEmpty && contact.emailAddress != null) {
           matchingUser = users.find { it.email?.toLowerCase() == contact.emailAddress.toLowerCase() || it.oldEmail?.toLowerCase() == contact.emailAddress.toLowerCase() }
         }
         if (matchingUser) {
           result.add([
           id: matchingUser.id,
           matchingContactId: contact.id,
           originalType: 'user',
           firstName: matchingUser.firstName ?: '',
           lastName: matchingUser.lastName ?: '',
           emailAddress: matchingUser.email?.toLowerCase(),
           enrollmentStatus: calculateUserEnrollmentStatus(matchingUser),
           enrollmentSubstatus: null,
           lastLogin: matchingUser.lastLogin,
           dateInvited: matchingUser.dateCreated,
           locale: matchingUser.locale,
           lastPasswordResetRequest: matchingUser.lastPasswordResetRequest,
           title: matchingUser.title,
           twoFactorAuthEnabled: matchingUser.twoFactorAuthEnabled,
           phoneNumber: matchingUser.phoneNumber,
           roles: matchingUser.roles
           ])
         } else {
           Map enrollmentStatuses = calculateContactEnrollmentStatus(contact.invitationEligibility)
           result.add([
           id: contact.id,
           matchingUserId: null,
           originalType : 'contact',
           firstName : contact.firstName ?: '',
           lastName : contact.lastName ?: '',
           emailAddress : contact.emailAddress?.toLowerCase(),
           enrollmentStatus : enrollmentStatuses.mainStatus,
           enrollmentSubstatus : enrollmentStatuses.substatus,
           lastLogin : null,
           dateInvited: null,
           phoneNumber: contact.phoneNumber,
           role: contact.role
           ])
         }
       }
     }
   } catch(Exception e) {
     log.info("could not retrieve users and contacts for companyId: ${companyId} and SupplierBranchId: ${supplierBranchId}…