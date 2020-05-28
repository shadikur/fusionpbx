#!/bin/sh

# Author : M Rahman
# Copyright (c) shadikur.com
# Script follows here:

#All the variables
$php_ini_file = '/etc/php/7.3/fpm/php.ini'

#Update PHP Settings
sed 's#post_max_size = .*#post_max_size = 80M#g' -i $php_ini_file
sed 's#upload_max_filesize = .*#upload_max_filesize = 80M#g' -i $php_ini_file
sed 's#;max_input_vars = .*#max_input_vars = 8000#g' -i $php_ini_file
sed 's#; max_input_vars = .*#max_input_vars = 8000#g' -i $php_ini_file

service nginx restart