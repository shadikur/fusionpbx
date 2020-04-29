#!/bin/sh

# Author : M Rahman
# Copyright (c) shadikur.com
# Script follows here:

#All the variables
bold=$(tput bold)
normal=$(tput sgr0)
green=$(tput setaf 2)

echo "${bold}${green}Checking Free Space...${normal}"
df -h

echo "${bold}${green}Checking Free Available RAM...${normal}"
free -m

echo "${bold}${green}Cleaning Temporary Files...${normal}"
rm -rf /tmp/*
apt autoclean -y
apt autoremove -y
