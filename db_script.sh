#!/usr/bin/env sh

######################################################################
# @author      : newos (newos@$HOSTNAME)
# @file        : db_script
# @created     : Tuesday Nov 19, 2024 14:06:30 CET
#
# @description : 
######################################################################

#!/bin/bash
# Start MariaDB in the background

mysqld_safe &

# Wait for MariaDB to start (you can adjust the sleep time as needed)
until mysqladmin ping --silent; do
  echo "Waiting for MariaDB to be available..."
  sleep 2
done

# Now that MariaDB is running, run the initialization SQL file
echo "CREATE DATABASE IF NOT EXISTS $DB_DATABASE;" >> /var/lib/mysql/init-db.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' ;" >>  /var/lib/mysql/init-db.sql
echo "GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USER'@'%';" >>  /var/lib/mysql/init-db.sql
echo "FLUSH PRIVILEGES;" >>  /var/lib/mysql/init-db.sql

mysql <  /var/lib/mysql/init-db.sql

# Keep MariaDB running in the foreground
wait

