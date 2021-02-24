#!/bin/sh

# Author : M Rahman
# Copyright (c) shadikur.com
# Script follows here:

#Download the codec 
echo "Cloning Apps .."
cd /usr/src
git clone https://github.com/shadikur/fusionpbx.git
cd fusionpbx

echo "Copy apps to the fusionpbx core ..."
cp web_dialer /var/www/fusionpbx/apps/webphone

echo "Webphone has been installed. You can now run upgrade by going Advanced > Upgrade > Run with Schema, Menu & Permission!"

echo "Please make sure you have valid SSL and WebRTC enabled."
