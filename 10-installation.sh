#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
   echo "Please run this script with root user access"
   exit 1
fi

echo "Installing Nginx web server"
dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "Installig Nginx is failuer"
    exit 1
else
    echo "Nginx installed successfully"
fi