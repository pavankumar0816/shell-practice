#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
   echo "Please run this script with root user access"
   exit 1
fi

validate(){
   if( $1 != 0 ); then
        echo "$2 is failure"
        exit 1
    else
        echo "$2 is success"
    fi 
}

dnf install nginx -y
validate $? "Nginx Installation"

dnf install mysql -y
validate $? "Mysql Installation"

dnf install nodejs -y
validate $? "Nodejs Installation"
