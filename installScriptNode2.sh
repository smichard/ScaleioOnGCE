#! /bin/bash
sudo MDM_ROLE_IS_MANAGER=1 rpm -i EMC-ScaleIO-mdm-2.0-5014.0.el7.x86_64.rpm
sudo rpm -i EMC-ScaleIO-sds-2.0-5014.0.el7.x86_64.rpm
sudo MDM_IP=10.132.0.2,10.132.0.3 rpm -i EMC-ScaleIO-sdc-2.0-5014.0.el7.x86_64.rpm

