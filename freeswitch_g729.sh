#!/bin/sh

# Author : M Rahman
# Copyright (c) shadikur.com
# Script follows here:

#Download the codec 
rm -rf /usr/lib/freeswitch/mod/mod_bcg729.so
wget -P /usr/lib/freeswitch/mod http://develop.shadikur.com/fs/mod_bcg729.so

#Unload existing G729 codec
/usr/bin/fs_cli -x "unload mod_g729"

#Load the new codec
/usr/bin/fs_cli -x "load mod_bcg729.so"

echo "Codec G729 has been installed."

echo "Show overview of the codecs."
 fs_cli -x "show codec"
