#!/bin/bash

# change this
LOGIN=""
PASSWORD=""

# change this only if explicitly told
SERVER="cms.realpad.eu"
API_VERSION="v10"
ENDPOINTS="list-excel-customers list-excel-projects list-excel-products list-excel-business-cases list-excel-payments-incoming list-excel-events"

TIMESTAMP=`date +%Y-%m-%d@%H-%M-%S`

for ENDPOINT in ${ENDPOINTS}
do
    curl --data "login=${LOGIN}&password=${PASSWORD}" "https://${SERVER}/ws/${API_VERSION}/${ENDPOINT}" > "${ENDPOINT}-${TIMESTAMP}.xls"
done
