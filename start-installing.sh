#!/bin/bash
#
## Download and unzip WordPress
wget https://wordpress.org/wordpress-6.4.zip  -P /tmp
unzip /tmp/wordpress-6.4.zip -d /var/www/html >> /dev/null
rm /tmp/wordpress-6.4.zip
chown -R www-data:www-data /var/www/html/wordpress \
    && chmod -R 755 /var/www/html/wordpress
mv /var/www/html/wordpress/wp-config-sample.php  /var/www/html/wordpress/wp-config.php


sed -i -r "s/database_name_here/$DB_DATABASE/1"  /var/www/html/wordpress/wp-config.php
sed -i -r "s/username_here/$DB_USER/1" /var/www/html/wordpress/wp-config.php
sed -i -r "s/password_here/$DB_PASSWORD/1"   /var/www/html/wordpress/wp-config.php
sed -i -r "s/localhost/mariadb/1"   /var/www/html/wordpress/wp-config.php
echo "WordPress Is Ready!!!!!"
php-fpm7.3 -F
