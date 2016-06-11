#! /bin/bash
sudo MDM_ROLE_IS_MANAGER=1 rpm -i EMC-ScaleIO-mdm-2.0-5014.0.el7.x86_64.rpm
sudo rpm -i EMC-ScaleIO-sds-2.0-5014.0.el7.x86_64.rpm
sudo MDM_IP=10.132.0.2,10.132.0.3 rpm -i EMC-ScaleIO-sdc-2.0-5014.0.el7.x86_64.rpm
# Create large file to add as ScaleIO device
fallocate -l 101G sio1dev1.io
# ScaleIO Management
scli --create_mdm_cluster --master_mdm_ip 10.132.0.2 --master_mdm_management_ip 104.155.6.242 --master_mdm_name mdm1 --accept_license
scli --login --username admin --password admin
scli --set_password --old_password admin --new_password Scaleio123
scli --login --username admin --password Scaleio123
scli --add_standby_mdm --new_mdm_ip 10.132.0.3 --mdm_role manager --new_mdm_management_ip 10.132.0.3 --new_mdm_name mdm2
scli --add_standby_mdm --new_mdm_ip 10.132.0.4 --mdm_role tb --new_mdm_name tb1
scli --switch_cluster_mode --cluster_mode 3_node --add_slave_mdm_name mdm2 --add_tb_name tb1
# Adding Domain, Pool and SDS
scli --add_protection_domain --protection_domain_name system
scli --mdm_ip 10.132.0.2 --add_storage_pool --protection_domain_name system --storage_pool_name pool1
scli --add_sds --sds_ip 10.132.0.2 --protection_domain_name system --storage_pool_name pool1 --sds_name sds1
scli --add_sds --sds_ip 10.132.0.3 --protection_domain_name system --storage_pool_name pool1 --sds_name sds2
scli --add_sds --sds_ip 10.132.0.4 --protection_domain_name system --storage_pool_name pool1 --sds_name sds3
