#!/bin/bash
#
## Download and unzip WordPress
wget https://wordpress.org/latest.zip -P /tmp
unzip /tmp/latest.zip -d /var/www/html
rm /tmp/latest.zip
chown -R www-data:www-data /var/www/html/wordpress \
    && chmod -R 755 /var/www/html/wordpress
mv /var/www/html/wordpress/wp-config-sample.php  /var/www/html/wordpress/wp-config.php

cat /var/www/html/wordpress/wp-config.php 

sed -i -r "s/db1/$db_name/1"  /var/www/html/wordpress/wp-config.php
sed -i -r "s/user/$db_user/1" /var/www/html/wordpress/wp-config.php
sed -i -r "s/pwd/$db_pwd/1"   /var/www/html/wordpress/wp-config.php
php-fpm7.3 -F
