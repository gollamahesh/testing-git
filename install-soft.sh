#!/bin/bash
Date=$(date +%F)
echo $Date
Logdirectory=/home/centos/shell-scripts/logs
Script_name=$0
Logfile=$Logdirectory+$Script_name-$Date.log
Userid=$(id -u)
R="\e[31m"
G="\e[31m"
N="\e[om"
Y="\e[33m"

if[ $Userid -ne 0]
then
    echo -e "$R Error: $N Please login with root user"
    exit 1
fi