#!/bin/bash
#
## Download and unzip WordPress
#wget https://wordpress.org/wordpress-6.4.zip  -P /tmp
#unzip /tmp/wordpress-6.4.zip -d /var/www/html >> /dev/null
#rm /tmp/wordpress-6.4.zip
#chown -R www-data:www-data /var/www/html/wordpress \
#    && chmod -R 755 /var/www/html/wordpress
#mv /var/www/html/wordpress/wp-config-sample.php  /var/www/html/wordpress/wp-config.php
cd /var/www/html

wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

#mv /wp-config.php /var/www/html/wp-config.php

sed -i -r "s/database_name_here/$DB_DATABASE/1"  /var/www/html/wp-config.php
sed -i -r "s/username_here/$DB_USER/1" /var/www/html/wp-config.php
sed -i -r "s/password_here/$DB_PASSWORD/1"   /var/www/html/wp-config.php
sed -i -r "s/localhost/mariadb/1"   /var/www/html/wp-config.php

wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root



echo "WordPress Is Ready!!!!!"
php-fpm7.3 -F
