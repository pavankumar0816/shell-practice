#!/bin/bash

userid=$(id -u)

if [$userid -ne 0]; then
   echo "Please run this script with root user access"
fi

echo "Installing Nginx web server"
dnf install nginx -y