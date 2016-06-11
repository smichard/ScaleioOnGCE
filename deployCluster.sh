#! /bin/bash
gcloud compute --project "newco2106" instances create "scaleio1" --zone "europe-west1-b" --machine-type "n1-standard-2" --network "default" --maintenance-policy "MIGRATE" --scopes default="https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/cloud.useraccounts.readonly" --tags "http-server","https-server" --image "/centos-cloud/centos-7-v20160418" --boot-disk-size "105" --boot-disk-type "pd-standard" --boot-disk-device-name "scaleio1" --private-network-ip 10.132.0.2 --metadata-from-file startup-script=startUpScript.sh
gcloud compute --project "newco2106" instances create "scaleio2" --zone "europe-west1-b" --machine-type "n1-standard-2" --network "default" --maintenance-policy "MIGRATE" --scopes default="https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/cloud.useraccounts.readonly" --tags "http-server","https-server" --image "/centos-cloud/centos-7-v20160418" --boot-disk-size "105" --boot-disk-type "pd-standard" --boot-disk-device-name "scaleio2" --private-network-ip 10.132.0.3 --metadata-from-file startup-script=startUpScript.sh
gcloud compute --project "newco2106" instances create "scaleio3" --zone "europe-west1-b" --machine-type "n1-standard-2" --network "default" --maintenance-policy "MIGRATE" --scopes default="https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/cloud.useraccounts.readonly" --tags "http-server","https-server" --image "/centos-cloud/centos-7-v20160418" --boot-disk-size "105" --boot-disk-type "pd-standard" --boot-disk-device-name "scaleio3" --private-network-ip 10.132.0.4 --metadata-from-file startup-script=startUpScript.sh
gcloud compute firewall-rules create firewallscaleio1 --allow tcp:9011 --source-ranges=0.0.0.0/0 --description="Open port for ScaleIO GUI"
gcloud compute firewall-rules create firewallscaleio2 --allow tcp:6611 --source-ranges=0.0.0.0/0 --description="Open port for ScaleIO GUI"
