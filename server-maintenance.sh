#!/bin/sh

# Author : M Rahman
# Copyright (c) shadikur.com
# Script follows here:

#All the variables
bold=$(tput bold)
normal=$(tput sgr0)
green=$(tput setaf 2)
now=$(date +%Y-%m-%d)

echo "Maintenance Start time: "
date
echo "\n"
echo "${bold}${green}Checking Free Space...${normal}"
df -h
echo "\n"
echo "${bold}${green}Checking Free Available RAM...${normal}"
free -m
echo "\n"
echo "${bold}${green}Cleaning Temporary Files...${normal}"
rm -rf /tmp/*
apt autoclean -y
apt autoremove -y

rm -rf /var/backups/dpkg.diversions.*.gz
rm -rf /var/backups/dpkg.stat*.*.gz
#remove old log
rm -rf /var/log/freeswitch/freeswitch.log
#setting permission 
touch /var/log/freeswitch/freeswitch.log
chmod g+w /var/log/freeswitch/freeswitch.log
chown www-data:www-data /var/log/freeswitch/freeswitch.log

echo "${bold}${green}FusionPBX old backups deleted...${normal}"
#delete postgres backups
find /var/backups/fusionpbx/postgresql/fusionpbx_pgsql* -mtime +4 -exec rm {} \;
#delete the main backup
find /var/backups/fusionpbx/*.tgz -mtime +2 -exec rm {} \;
echo "\n"
echo "${bold}${green}Server maintainace completed!${normal}"