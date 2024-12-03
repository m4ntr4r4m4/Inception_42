#!/usr/bin/env sh

######################################################################
# @author      : ahammoud (ahammoud@$HOSTNAME)
# @file        : run
# @created     : Tuesday Dec 03, 2024 20:07:35 CET
#
# @description : 
######################################################################


docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null
