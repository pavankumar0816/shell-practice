#!/bin/bash

userid=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $userid -ne 0 ]; then
   echo -e "$R Please run this script with root user access $N" | tee -a $LOGS_FILE
   exit 1
fi

mkdir -p $LOGS_FOLDER

validate(){
   if [ $1 -ne 0 ]; then
        echo -e "$2 ... $R is failure $N" | tee -a $LOGS_FILE
        exit 1
    else
        echo -e "$2 ... $G is success $N" | tee -a $LOGS_FILE
    fi 
}

for package in $@ # sudo sh 14-loops.sh nginx mysql nodejs
do
    dnf list installed $package &>>$LOGS_FILE
    if [ $? -ne 0 ]; then
        echo "$package is not installed, Installing now" 
        dnf install $package -y &>>$LOGS_FILE
        validate $? "$package installation"
    else
        echo -e "$package is already installed, $Y Skipping installation $N"
    fi
done
