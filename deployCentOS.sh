#! /bin/bash
gcloud compute --project "newco2106" instances create "scaleio1" "scaleio2" "scaleio3" --zone "europe-west1-b" --machine-type "n1-standard-2" --network "default" --maintenance-policy "MIGRATE" --scopes default="https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/cloud.useraccounts.readonly" --tags "http-server","https-server" --image "/centos-cloud/centos-7-v20160418" --boot-disk-size "100" --boot-disk-type "pd-ssd" --boot-disk-device-name "scaleio1" --metadata-from-file startup-script=startUpScript.sh

#copy gateway to first node


