# Deploy ScaleIO on Google Compute Engine


This repository contains a set of shell scripts which enable you to set up [EMC ScaleIO](http://www.emc.com/getscaleio) on [Google Compute Engine](https://cloud.google.com/compute/).  
Once the ScaleIO source files are downloaded from [emc.com/getscaleio](http://www.emc.com/getscaleio) to your local machine, three CentOS nodes are going to be deployed on GCE. The source files are then uploaded to GCE and executed. At the end you can open the ScaleIO GUI and point it towards the ScaleIO cluster on GCE. With a high speed internet connection this should not take longer than 15 minutes.

## Prerequisites
This set of scripts was tested on Ubuntu 14.04 and 16.04:  
1. Install the [Google Cloud SDK](https://cloud.google.com/sdk/downloads) on your machine.  
2. Install the Java Runtime Enviroment on your machine.

## Getting Started
1. `git clone https://github.com/smichard/ScaleioOnGCE`
2. run the `getSourceFiles.sh` script.  
This script creates a folder for the source files. The source files are downloaded from [emc.com/getscaleio](https://www.emc.com/getscaleio) to the new folder. The necessary source files are uncompressed and the ScaleIO GUI for Linux is installed.
3. edit the `deployCluster.sh` script before executing (lines 2-4):
``` bash
gcloud compute --project "YourProjectID" instances create "scaleio1" --zone "europe-west1-b" --machine-type "n1-standard-2" --network "default" --maintenance-policy "MIGRATE" --scopes default="https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/cloud.useraccounts.readonly" --tags "http-server","https-server" --image "/centos-cloud/centos-7-v20160418" --boot-disk-size "205" --boot-disk-type "pd-ssd" --boot-disk-device-name "scaleio1" --private-network-ip 10.132.0.2 --metadata-from-file startup-script=startUpScript.sh
gcloud compute --project "YourProjectID" instances create "scaleio2" --zone "europe-west1-b" --machine-type "n1-standard-2" --network "default" --maintenance-policy "MIGRATE" --scopes default="https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/cloud.useraccounts.readonly" --tags "http-server","https-server" --image "/centos-cloud/centos-7-v20160418" --boot-disk-size "205" --boot-disk-type "pd-ssd" --boot-disk-device-name "scaleio2" --private-network-ip 10.132.0.3 --metadata-from-file startup-script=startUpScript.sh
gcloud compute --project "YourProjectID" instances create "scaleio3" --zone "europe-west1-b" --machine-type "n1-standard-2" --network "default" --maintenance-policy "MIGRATE" --scopes default="https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/cloud.useraccounts.readonly" --tags "http-server","https-server" --image "/centos-cloud/centos-7-v20160418" --boot-disk-size "205" --boot-disk-type "pd-ssd" --boot-disk-device-name "scaleio3" --private-network-ip 10.132.0.4 --metadata-from-file startup-script=startUpScript.sh
```
enter your project ID as indicated above. This script creates three CentOS 7 VM's (machine-type: n1-standard-2, zone: europe-west1, disk-type: pd-ssd) with 205 GB of storage. The VM's are labeled as **scaleio1**, **scaleio2** and **scaleio3**. The use of the `startUpScript.sh` ensures that all necessary packages are installed on each VM. Furthermore this script adds the necessary firewall rules in order to able to connect to the ScaleIO cluster.
4. edit the `installScriptNode1.sh`. Change the management IP addresses (`--new_mdm_management_ip`) of the primary and secondary MDM (line 9 and 13) to the public IP addresses of your VM's **sclaeio1** and **scaleio2**:
``` bash
...
scli --create_mdm_cluster --master_mdm_ip 10.132.0.2 --master_mdm_management_ip 104.155.60.64 --master_mdm_name mdm1 --accept_license
...
scli --add_standby_mdm --new_mdm_ip 10.132.0.3 --mdm_role manager --new_mdm_management_ip 104.155.3.69 --new_mdm_name mdm2
...
```
5. execute the `copySourceFiles.sh` script. This script copies the necessary source files and the corresponding install scripts to each CentOS VM.
6. login to each node via `gcloud compute ssh`, and run the according install scripts. Start with **scaleio2** or **scaleio3**, execute **scaleio1** as the last one.
7. run `runGui.sh` script. This script opens the the ScaleIO GUI. You can point it to the public IP address of your primary MDM (public IP of **scaleio1**). Login with the following credentials:  
username: admin  
password: ScaleIO123  
8. once you are done exploring the ScaleIO installation. Run the `deleteCluster.sh` script in order to avoid unnecessary costs.

