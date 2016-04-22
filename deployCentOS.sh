#! /bin/bash
gcloud compute --project "newco2106" instances create "scaleio1" "scaleio2" "scaleio3" --zone "europe-west1-b" --machine-type "n1-standard-2" --network "default" --maintenance-policy "MIGRATE" --scopes default="https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/cloud.useraccounts.readonly" --tags "http-server","https-server" --image "/centos-cloud/centos-7-v20160418" --boot-disk-size "100" --boot-disk-type "pd-ssd" --boot-disk-device-name "scaleio1" --metadata-from-file startup-script=startUpScript.sh
gcloud compute copy-files ./sourceFiles/ScaleIO_2.0.0_Gateway_for_Linux_Download/EMC-ScaleIO-gateway-2.0-5014.0.x86_64.rpm scaleio1:~/
gcloud compute copy-files ./installGateway.sh scaleio1:~/

