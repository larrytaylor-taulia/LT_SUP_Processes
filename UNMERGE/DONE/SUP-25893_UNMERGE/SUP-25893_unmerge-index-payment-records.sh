#!/bin/bash
# set -x

# ---------------- CONFIGURATION ----------------

# The target environment. Valid values are: 'na1prd', 'eu1prd' and 'staging'.
ENVIRONMENT='na1prd'

# The Id of the company that has just been unmerged.
COMPANY_ID='c1dec84839cb4c6b903ff478eef4da7f'

# -------------- END CONFIGURATION --------------

TIMESTAMP=`date +%s`
TODAY=`date +'%d%m%Y'`
USER_ID='9731185f3a6b48209dc844df8589a23d'
APP_ADMIN_CERT_PATH="/tmp/app-admin-server-${ENVIRONMENT}.cert"
APP_ADMIN_KEY_PATH="/tmp/app-admin-server-${ENVIRONMENT}.key"

# Grab the the app-admin pod name (get the first one if mulitple)
APP_ADMIN_POD_NAME=$(kubectl get pods -l app=app-admin -o custom-columns=:metadata.name --no-headers | tail -1)

echo "Copying cert/key from pod: ${ENVIRONMENT}/${APP_ADMIN_POD_NAME} locally to ${APP_ADMIN_CERT_PATH} and ${APP_ADMIN_KEY_PATH}..."

# Copy pods' cert/key locally
kubectl cp $ENVIRONMENT/$APP_ADMIN_POD_NAME:/etc/shared/certificates/temp/server.crt $APP_ADMIN_CERT_PATH
kubectl cp $ENVIRONMENT/$APP_ADMIN_POD_NAME:/etc/shared/certificates/temp/server.key $APP_ADMIN_KEY_PATH

# Grab the intapi-remittance-mass-indexing pod name (get the first one if mulitple)
MASS_INDEXING_POD_NAME=$(kubectl get pods -l app=intapi-remittance -o custom-columns=:metadata.name --no-headers | grep mass-indexing | tail -1)

# Forward all local requests on port 8442 to intapi-remittance-mass-indexing pod on port 8443
echo "Forwarding all local requests on port 8442 to ${MASS_INDEXING_POD_NAME} on port 8443..."

kubectl port-forward $MASS_INDEXING_POD_NAME 8442:8443 &

# Give a chance of port-forward to complete
sleep 20

# Partial indexing
echo "Starting partial indexing..."
curl -k --connect-timeout 15 https://localhost:8442/massindexing/start \
-H "Content-Type: application/json" \
-H "x-tau-client-name: intapi-remittance-client" \
-H "x-tau-client-type: USER" \
-H "x-tau-client-version: 3.4.2" \
-H "x-tau-request-id: massindexing-${TODAY}" \
-H "x-tau-request-source: cURL" \
-H "x-tau-request-timestamp: ${TIMESTAMP}" \
-H "x-tau-userid: ${USER_ID}" \
-H "x-tau-userroles: BUYER_ERP_SYSTEM_ENTITY" \
-H "x-tau-companyid: ${COMPANY_ID}" \
-H "x-tau-client-type: USER" \
-H "x-tau-restriction-types: Company" \
-d "{\"filterQuery\": \"from SupplierPaymentRecordSearch WHERE supplierRelation.id IN (SELECT id from SupplierRelation WHERE supplierDetails.id IN (SELECT id from SupplierDetails WHERE supplierMaster.id IN (SELECT id from SupplierMaster WHERE company.id IN ('${COMPANY_ID}'))))\"}" \
-X POST \
--cert $APP_ADMIN_CERT_PATH \
--key $APP_ADMIN_KEY_PATH 

echo ""
echo "Partial indexing has successfully started"


# Clean-up / stop port forwarding
rm -f $APP_ADMIN_CERT_PATH
rm -f $APP_ADMIN_KEY_PATH
pkill -f "kubectl port-forward ${MASS_INDEXING_POD_NAME}"