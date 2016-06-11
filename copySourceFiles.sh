#! /bin/bash
# SclaeIO Node 1
# ScaleIO Node 2
gcloud compute copy-files ./sourceFiles/ScaleIO_2.0.0_RHEL7_Download/EMC-ScaleIO-mdm-2.0-5014.0.el7.x86_64.rpm scaleio2:~/
gcloud compute copy-files ./sourceFiles/ScaleIO_2.0.0_RHEL7_Download/EMC-ScaleIO-sds-2.0-5014.0.el7.x86_64.rpm scaleio2:~/
gcloud compute copy-files ./sourceFiles/ScaleIO_2.0.0_RHEL7_Download/EMC-ScaleIO-sdc-2.0-5014.0.el7.x86_64.rpm scaleio2:~/
gcloud compute copy-files ./installScriptNode2.sh scaleio2:~/
# ScaleIO Node 3
gcloud compute copy-files ./sourceFiles/ScaleIO_2.0.0_RHEL7_Download/EMC-ScaleIO-mdm-2.0-5014.0.el7.x86_64.rpm scaleio3:~/
gcloud compute copy-files ./sourceFiles/ScaleIO_2.0.0_RHEL7_Download/EMC-ScaleIO-sds-2.0-5014.0.el7.x86_64.rpm scaleio3:~/
gcloud compute copy-files ./sourceFiles/ScaleIO_2.0.0_RHEL7_Download/EMC-ScaleIO-sdc-2.0-5014.0.el7.x86_64.rpm scaleio3:~/
gcloud compute copy-files ./installScriptNode3.sh scaleio3:~/
# SclaeIO Node 1
gcloud compute copy-files ./sourceFiles/ScaleIO_2.0.0_RHEL7_Download/EMC-ScaleIO-mdm-2.0-5014.0.el7.x86_64.rpm scaleio1:~/
gcloud compute copy-files ./sourceFiles/ScaleIO_2.0.0_RHEL7_Download/EMC-ScaleIO-sds-2.0-5014.0.el7.x86_64.rpm scaleio1:~/
gcloud compute copy-files ./sourceFiles/ScaleIO_2.0.0_RHEL7_Download/EMC-ScaleIO-sdc-2.0-5014.0.el7.x86_64.rpm scaleio1:~/
gcloud compute copy-files ./installScriptNode1.sh scaleio1:~/
