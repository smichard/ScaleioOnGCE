#! /bin/bash
gcloud compute copy-files ./installGateway.sh scaleio1:~/
gcloud compute copy-files ./sourceFiles/ScaleIO_2.0.0_Gateway_for_Linux_Download/EMC-ScaleIO-gateway-2.0-5014.0.x86_64.rpm scaleio1:~/
