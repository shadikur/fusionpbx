#!/bin/sh

# Author : M Rahman
# Copyright (c) shadikur.com
# Script follows here:

#All the variables
bold=$(tput bold)
normal=$(tput sgr0)
green=$(tput setaf 2)
now=$(date +%Y-%m-%d)


echo "${green}Installation Started ...${normal}"
echo "\n"

#Download the codec 
echo "Backup old Repo."
mv /usr/src/fusionpbx /usr/src/fusionpbx-old
echo "\n"
echo "Cloning Apps .."
cd /usr/src
git clone https://github.com/shadikur/fusionpbx.git
cd fusionpbx
echo "\n"
echo "Copy apps to the fusionpbx core ..."
cp -R /usr/src/fusionpbx/web_dialer /var/www/fusionpbx/app/
mv /var/www/fusionpbx/app/web_dialer /var/www/fusionpbx/app/webphone
echo "Updating Permission ..."
chown -R www-data:www-data /var/www/fusionpbx/app/webphone
sleep 2 && echo "${green}OK${normal}"
echo "\n"

echo "${green}Webphone has been installed. You can now run upgrade by going Advanced > Upgrade > Run with Schema, Menu & Permission!"

echo "Please make sure you have valid SSL and WebRTC enabled.${normal}"