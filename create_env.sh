#!/usr/bin/env sh

######################################################################
# @author      : ahammoud (ahammoud@$HOSTNAME)
# @file        : create_env
# @created     : Saturday Nov 23, 2024 18:37:03 CET
#
# @description : 
######################################################################

echo "Enter Database Name:"
read db
echo "DB_DATABASE=$db" >> ./src/.env

echo "Enter db USER  Name:"
read db
echo "DB_USER=$db" >> ./src/.env

echo "Enter DB_PASSWORD Name:"
read db
echo "DB_PASSWORS=$db" >> ./src/.env

echo "Enter domain Name:"
read db
echo "DOMAIN_NAME=$db" >> ./src/.env

echo "Enter WP_TITLE:"
read db
echo "WP_TITLE=$db" >> ./src/.env

echo "Enter WP_ADMIN_USR:"
read db
echo "WP_ADMIN_USR=$db" >> ./src/.env
echo "Enter WP_ADMIN_PWD :"
read db
echo "WP_ADMIN_PWD=$db" >> ./src/.env
echo "Enter WP_ADMIN_EMAIL:"
read db
echo "WP_ADMIN_EMAIL=$db" >> ./src/.env
echo "Enter WP_USR:"
read db
echo "WP_USR=$db" >> ./src/.env
echo "Enter WP_EMAIL:"
read db
echo "WP_EMAIL=$db" >> ./src/.env
echo "Enter WP_PWD:"
read db
echo "WP_PWD=$db" >> ./src/.env

