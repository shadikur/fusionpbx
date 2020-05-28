#!/bin/sh

# Author : M Rahman
# Copyright (c) shadikur.com
# Script follows here:

#Update PHP Settings
sed 's#post_max_size = .*#post_max_size = 80M#g' -i /etc/php/7.3/fpm/php.ini
sed 's#upload_max_filesize = .*#upload_max_filesize = 80M#g' -i /etc/php/7.3/fpm/php.ini
sed 's#;max_input_vars = .*#max_input_vars = 8000#g' -i /etc/php/7.3/fpm/php.ini
sed 's#; max_input_vars = .*#max_input_vars = 8000#g' -i /etc/php/7.3/fpm/php.ini

service nginx restart