#!/usr/bin/env bash

source t3tools/scripts/t3helper/load_json.sh

printf "\e[32m"
read -p "Do you want to add your local Domain and Disable all others? [Y/N]? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo
    echo "Disable all Domains"
    echo
    sleep 2
    mysql -u$local_dbuser -p$local_dbpassword -h$local_dbhost -e "UPDATE $local_dbname.sys_domain SET hidden = 1"
    echo "All Domains are disabled now"
    sleep 1
    echo
    echo "Add Local Domain '$local_domain'"
    mysql -u$local_dbuser -p$local_dbpassword -h$local_dbhost -e "INSERT INTO $local_dbname.sys_domain (pid, hidden, domainName) VALUES ('1','0','$local_domain')"
    echo
    echo "Local Domain ready"
    echo
else
    echo Exit without changes
    exit
fi
printf "\e[37m"