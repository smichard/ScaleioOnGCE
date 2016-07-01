#! /bin/bash
# copy ScaleIO packages to node 2: scaleio2
gcloud compute copy-files ./sourceFiles/ScaleIO_2.0.0.1_RHEL7_Download/EMC-ScaleIO-mdm-2.0-6035.0.el7.x86_64.rpm scaleio2:~/
gcloud compute copy-files ./sourceFiles/ScaleIO_2.0.0.1_RHEL7_Download/EMC-ScaleIO-sds-2.0-6035.0.el7.x86_64.rpm scaleio2:~/
gcloud compute copy-files ./sourceFiles/ScaleIO_2.0.0.1_RHEL7_Download/EMC-ScaleIO-sdc-2.0-6035.0.el7.x86_64.rpm scaleio2:~/
gcloud compute copy-files ./installScriptNode2.sh scaleio2:~/
# copy ScaleIO packages to node 3: scaleio3
gcloud compute copy-files ./sourceFiles/ScaleIO_2.0.0.1_RHEL7_Download/EMC-ScaleIO-mdm-2.0-6035.0.el7.x86_64.rpm scaleio3:~/
gcloud compute copy-files ./sourceFiles/ScaleIO_2.0.0.1_RHEL7_Download/EMC-ScaleIO-sds-2.0-6035.0.el7.x86_64.rpm scaleio3:~/
gcloud compute copy-files ./sourceFiles/ScaleIO_2.0.0.1_RHEL7_Download/EMC-ScaleIO-sdc-2.0-6035.0.el7.x86_64.rpm scaleio3:~/
gcloud compute copy-files ./installScriptNode3.sh scaleio3:~/
# copy ScaleIO packages to node 1: scaleio1
gcloud compute copy-files ./sourceFiles/ScaleIO_2.0.0.1_RHEL7_Download/EMC-ScaleIO-mdm-2.0-6035.0.el7.x86_64.rpm scaleio1:~/
gcloud compute copy-files ./sourceFiles/ScaleIO_2.0.0.1_RHEL7_Download/EMC-ScaleIO-sds-2.0-6035.0.el7.x86_64.rpm scaleio1:~/
gcloud compute copy-files ./sourceFiles/ScaleIO_2.0.0.1_RHEL7_Download/EMC-ScaleIO-sdc-2.0-6035.0.el7.x86_64.rpm scaleio1:~/
gcloud compute copy-files ./installScriptNode1.sh scaleio1:~/
