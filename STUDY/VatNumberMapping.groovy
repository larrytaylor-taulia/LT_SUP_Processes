package com.taulia.integration.hook.script.v1_0.colgate

import com.taulia.core.data.v1_0.bo.AddressData
import com.taulia.core.data.v1_0.bo.Invoice
import com.taulia.core.data.v1_0.bo.InvoiceCustomField
import com.taulia.core.data.v1_0.bo.InvoiceTaxIdentifier
import com.taulia.integration.hook.v1_0.EventType
import com.taulia.integration.hook.v1_0.InvoiceFormModificationHook
import com.taulia.integration.hook.v1_0.InvoiceHookContext
import com.taulia.integration.hook.v1_0.InvoiceModificationHook
import com.taulia.integration.hook.v1_0.InvoiceValidationHook
import com.taulia.integration.hook.v1_0.Message
import com.taulia.integration.hook.v1_0.ValidationMessage
import com.taulia.integration.hook.v1_0.form.FieldOption
import com.taulia.integration.hook.v1_0.form.invoice.InvoiceFormDefinition
import com.taulia.integration.hook.v1_0.util.HookUtil

/**
 *
 * VatNumbersForCompanyCodesHook: allows the supplier user to select a Customer VAT among a list of
 * tax codes supplied for the company code the supplier is issuing the invoice against.
 *
 * The hook uses a custom field named "CUSTOMER_VAT_NUMBERS" to present a list of VAT numbers. The numbers themselves
 * are read from a map "vatNumbers" stored in the attribute value storage of the CompanyCode object.
 *
 * The data in "vatNumbers" maps a company code address ID to a VAT number. When the invoice is submitted, the
 * customer's address is replaced with the address associated with the selected VAT number.
 *
 * If the PO or the company code has a specific company code, the hook will include it in as an option in the custom field.
 * The default company code address is used in that case.
 *
 * The hook hides the "Customer Tax Identifier" section from the invoice submission screen. However, the selected VAT
 * and the associated address are populated in the invoice object, so that information will appear on the submitted invoice
 * and its PDF for consistency in the layout with invoices submitted when this hook is not in effect. For the same reason
 * the hook hides the custom VAT selection field upon invoice submission.
 *
 */
class VatNumbersForCompanyCodesHook implements InvoiceFormModificationHook, InvoiceModificationHook, InvoiceValidationHook {

  static final String CUSTOM_FIELD_NAME = 'CUSTOMER_VAT_NUMBERS'
  static final String STANDARD_SELECT_MESSAGE_KEY = 'standard.label.select'
  static final String SELECT = 'Select'
  static final String VAT_TYPE = 'VAT'
  static final String PORTAL_SUBMITTED = 'PORTAL_SUBMITTED'
  static final String TAX_CLEARANCE = 'TAX_CLEARANCE'
  static final String API = 'API'
  static final String CUSTOM_FIELD_VALUE_REQUIRED = 'platformHooks.validation.colgate.customField.vatNumber.required'
  static final String BUYER_VAT_DOES_NOT_MATCH = 'platformHooks.validation.colgate.vatNumber.noMatch'
  static final String BUYER_VAT_REQUIRED = 'platformHooks.validation.colgate.vatNumber.required'
  static final String BUYER_VAT_FIELD_ID = 'buyerTaxIdValue'
  static final String CC_DEFAULT_ADDRESS_ID = 'ccTaxIdentifier'
  static final String PO_DEFAULT_ADDRESS_ID = 'poTaxIdentifier'
  public static final String VALIDATION_MESSAGE_DEFAULT_TEXT = 'Please select customer tax identifier.'

  @Override
  InvoiceFormDefinition modifyForm(Invoice invoice, InvoiceHookContext context, InvoiceFormDefinition form) {

    context.log("Calling modifyForm method for hook ${getClass()} for buyer id ${context.buyerId}")

    Map.Entry vatNumbersCustomField = HookUtil.getHeaderCustomFieldForName(context, CUSTOM_FIELD_NAME)
    Map<String, String> addressToVatMap = context.getVatNumbersForCompanyCode(invoice.customer.customer.id)

    if (vatNumbersCustomField && addressToVatMap) {
      List<FieldOption> options = new ArrayList<FieldOption>()

      addressToVatMap.each {
        AddressData address = context.getCompanyCodeAddressById(it.key)
        if (address) {
          FieldOption option = createFieldOption(it.value, it.value, it.key)
          options.add(option)
        } else {
          context.log("Cannot find company code address with ID ${it.key}")
        }
      }

      if (options.size() > 0) {
        String vatNumbersCustomFieldId = HookUtil.getHeaderCustomFieldIdByName(context, CUSTOM_FIELD_NAME)

        String defaultTaxIdentifier = context.getCompanyCodeTaxIdentifier(invoice.customer.customer.id)
        String defaultCompanyCodeAddressId = context.getDefaultCompanyCodeAddressId(invoice.customer.customer.id)

        if (defaultTaxIdentifier && defaultCompanyCodeAddressId) {
          options = [createFieldOption(defaultTaxIdentifier, defaultTaxIdentifier, CC_DEFAULT_ADDRESS_ID)] + options
        }

        String poTaxId = context.purchaseOrder?.taxIdentifier?.value

        if (poTaxId && poTaxId != defaultTaxIdentifier &&
            defaultCompanyCodeAddressId && !addressToVatMap.find { it.value == poTaxId }) {
          options = [createFieldOption(poTaxId, poTaxId, PO_DEFAULT_ADDRESS_ID)] + options
        }

        form.fields.find {
          it.id == vatNumbersCustomFieldId
        }?.with {
          it.options = [
            createFieldOption(STANDARD_SELECT_MESSAGE_KEY, SELECT, SELECT)
          ] + options
        }

        // Hide the entire Customer Tax Identifier section and display a notice at the top of the page
        form.features.vatNumberToAddressFeatureEnabled = true

      } else {
        HookUtil.hideCustomFieldOnForm(CUSTOM_FIELD_NAME, context, form)
      }
    } else {
      HookUtil.hideCustomFieldOnForm(CUSTOM_FIELD_NAME, context, form)
    }

    form
  }

  @Override
  Invoice modifyObject(Invoice invoice, InvoiceHookContext context) {
    context.log("Calling modifyObject method in hook ${getClass()} for buyer id ${context.buyerId}")

    InvoiceCustomField vatNumbersCustomField = HookUtil.getCustomFieldForName(invoice, CUSTOM_FIELD_NAME) as InvoiceCustomField

    if (!vatNumbersCustomField) {
      return invoice
    }

    Map<String, String> addressToVatMap = context.getVatNumbersForCompanyCode(invoice.customer.customer.id)

    if (!addressToVatMap) {
      return invoice
    }

    AddressData companyCodeAddress = context.getCompanyCodeAddress(invoice.customer.customer.id)

    if (vatNumbersCustomField.fieldValue == SELECT || vatNumbersCustomField.fieldValue == "") {
      // make sure the default company code address is selected in that case
      invoice.customer.toAddress = companyCodeAddress

      return invoice
    }

    if (vatNumbersCustomField.fieldValue == CC_DEFAULT_ADDRESS_ID) {
      invoice.customer.toAddress = companyCodeAddress
      invoice.customer.buyerTaxIdentifiers = [new InvoiceTaxIdentifier(value: context.getCompanyCodeTaxIdentifier(invoice.customer.customer.id), type: VAT_TYPE)]
    } else if (vatNumbersCustomField.fieldValue == PO_DEFAULT_ADDRESS_ID) {
      invoice.customer.toAddress = companyCodeAddress
      invoice.customer.buyerTaxIdentifiers = [new InvoiceTaxIdentifier(value: context.purchaseOrder.taxIdentifier.value, type: context.purchaseOrder.taxIdentifier.type)]
    } else {
      AddressData address = context.getCompanyCodeAddressById(vatNumbersCustomField.fieldValue)
      if (address) {
        String selectedVatNumber = addressToVatMap.find {
          it.key == vatNumbersCustomField.fieldValue
        }?.value

        invoice.customer.toAddress = address
        invoice.customer.buyerTaxIdentifiers = [new InvoiceTaxIdentifier(value: selectedVatNumber, type: VAT_TYPE)]
      }
    }

    // we don't want to have the custom field on the submitted invoice details and PDF
    if (context.eventType == EventType.ON_SUBMIT) {
      invoice.customFields.removeAll([vatNumbersCustomField])
    }

    invoice
  }

  @Override
  List<ValidationMessage> validate(Invoice invoice, InvoiceHookContext context) {
    context.log("Calling validate method for hook ${getClass()} for buyer id ${context.buyerId}")

    List<ValidationMessage> validationMessages = []

    Map<String, String> addressToVatMap = context.getVatNumbersForCompanyCode(invoice.customer.customer.id)
    if (!addressToVatMap) {
      return validationMessages
    }

    if (invoice.origin == PORTAL_SUBMITTED || invoice.origin == TAX_CLEARANCE) {
      String customFieldId = HookUtil.getHeaderCustomFieldIdByName(context, CUSTOM_FIELD_NAME)

      if (context.eventType == EventType.ON_SUBMIT && !invoice.customer.buyerTaxIdentifiers) {
        validationMessages.add(new ValidationMessage(CUSTOM_FIELD_VALUE_REQUIRED, VALIDATION_MESSAGE_DEFAULT_TEXT, ValidationMessage.GLOBAL_ERROR_FIELDNAME))
      } else if (context.eventType == EventType.ON_CHANGE && context.triggerField == customFieldId) {

        InvoiceCustomField vatNumbersCustomField = HookUtil.getCustomFieldForName(invoice, CUSTOM_FIELD_NAME) as InvoiceCustomField

        if (vatNumbersCustomField && (!vatNumbersCustomField.fieldValue || vatNumbersCustomField.fieldValue == SELECT)) {
          validationMessages.add(new ValidationMessage(CUSTOM_FIELD_VALUE_REQUIRED, VALIDATION_MESSAGE_DEFAULT_TEXT, customFieldId))
        }
      }
    }

    if (context.eventType == EventType.ON_SUBMIT && invoice.origin == API) {
      if (invoice.customer.buyerTaxIdentifiers?.size() > 0) {
        InvoiceTaxIdentifier buyerTax = invoice.customer.buyerTaxIdentifiers.get(0)

        if (buyerTax != context.purchaseOrder?.taxIdentifier?.value &&
            buyerTax != context.getCompanyCodeTaxIdentifier(invoice.customer.customer.id) &&
            !addressToVatMap.find { buyerTax.value == it.value }) {

          validationMessages.add(
            new ValidationMessage(
              BUYER_VAT_DOES_NOT_MATCH,
              "The provided VAT number ${buyerTax.value} does not match any of the allowed VAT numbers for this Company Code.",
              BUYER_VAT_FIELD_ID
            )
          )
        }
      } else {
        validationMessages.add(
          new ValidationMessage(
            BUYER_VAT_REQUIRED,
            'Please provide a valid customer tax identifier.',
            BUYER_VAT_FIELD_ID
          )
        )
      }
    }

    validationMessages
  }

  private FieldOption createFieldOption(String labelKey, String labelDefault, String value) {
    new FieldOption(
      label: new Message(
        key: labelKey,
        defaultMessage: labelDefault
      ),
      value: value
    )
  }
}







