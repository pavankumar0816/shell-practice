#!/bin/bash

userid=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"

if [ $userid -ne 0 ]; then
   echo "Please run this script with root user access" | tee -a $LOGS_FILE
   exit 1
fi

mkdir -p $LOGS_FOLDER

validate(){
   if [ $1 -ne 0 ]; then
        echo "$2 is failure" | tee -a $LOGS_FILE
        exit 1
    else
        echo "$2 is success" | tee -a $LOGS_FILE
    fi 
}

dnf install nginx -y &>> $LOGS_FILE
validate $? "Nginx Installation"

dnf install mysql -y &>> $LOGS_FILE
validate $? "Mysql Installation"

dnf install nodejs -y &>> $LOGS_FILE
validate $? "Nodejs Installation"
