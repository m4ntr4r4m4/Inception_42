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
envsubst < /docker-entrypoint-initdb.d/init-db.sql > /tmp/init-db.sql

mysqld_safe &

# Wait for MariaDB to start (you can adjust the sleep time as needed)
until mysqladmin ping --silent; do
  echo "Waiting for MariaDB to be available..."
  sleep 2
done

# Now that MariaDB is running, run the initialization SQL file
mysql < /docker-entrypoint-initdb.d/init-db.sql

# Keep MariaDB running in the foreground
wait

