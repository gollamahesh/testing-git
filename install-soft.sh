#!/bin/bash
Date=$(date +%F)
echo $Date
Logdirectory=/home/centos/shell-scripts/logs
Script_name=$0
Logfile=$Logdirectory+$Script_name-$Date.log
Userid=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ $Userid -ne 0 ]
then
    echo -e "$R Error: $N Please login with root user"
    exit 1
fi

Validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "Installing $2 ... $R Failure $N"
    else
        echo -e "Installing $2 ... $G Success $N"
    fi
}

yum install postfix -y
Validate $? "postfix"
