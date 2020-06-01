#!/bin/sh

# Author : M Rahman
# Copyright (c) shadikur.com
# Script follows here:

max_limit=10
alert_limit=1
email="me@shadikur.com"

#Check the running call
fs_cli -x 'show channels like external' > output.txt

#Trim output text
grep 'total' output.txt > ccput.txt
sed -i 's/total.//' ccput.txt
rm -rf email.txt

#Process Alert
ccvalue=$(cat ccput.txt)

if [ ${ccvalue} -eq ${alert_limit} ] && [ ${ccvalue} -gt ${alert_limit} ]
	then
	printf "Nearly reaching (${ccvalue}) to max concurrent(${max_limit}) call limit\n"
	echo "Nearly reaching (${ccvalue}) to max concurrent(${max_limit}) call limit\n" >> email.txt
	echo "Current Switch Status:\n " >> email.txt
	fs_cli -x "status" >> email.txt
	/usr/bin/mail -s "CC Limit Alert" ${email} < email.txt
fi