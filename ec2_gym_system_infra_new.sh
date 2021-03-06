#!/bin/bash
# Version: 1.0

#Deleting previous ip addresses of instances from ANSIBLE inventory
sed -i '/^[0-9]/d' hosts
sleep 1

#Launching EC2 instances  
ansible-playbook gym_mgmt_system_setup_elb_v2.yml
sleep 1

#installing Docker on Docker1 and Docker2
ansible-playbook docker_install_centos.yml

grep [0-9] hosts > ip_list

sleep 1

#Launching RDS 



#inserting tables
#sudo mysql -h `cat rds-hostname.txt` -u bhushan -p ganesha123 < gym_management_system.sql

#Launching containers 
ansible-playbook docker_launch_xampp_v2_new.yml --extra-vars "instance1=`cat ip_list| head -1` instance2=`cat ip_list| tail -1` paswd=ganesha@123"



#hm=`cat rds-hostname.txt`
#sed -i "s/abc/${cat rds-hostname.txt}/g" old.txt

#sed -i "s/127.0.0.1/${hm}/g; s/root/bhushan/g; s/""/"ganesha123"/g"  /opt/lampp/htdocs/gym_management_system/includes/db_connect.php
