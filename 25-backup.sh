#!/bin/bash

userid=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/backup.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # 14 days is the default value, if the user not supplied

if [ $userid -ne 0 ]; then
   echo -e "$R Please run this script with root user access $N" | tee -a $LOGS_FILE
   exit 1
fi

mkdir -p $LOGS_FOLDER

USAGE(){
    echo -e "$R USAGE:: sudo backup <source_DIR> <DEST_DIR> <DAYS>[default 14 days] $N"
    exit 1
}

if [ $# -le 2 ]; then
   USAGE
fi

if [ ! -d $SOURCE_DIR ]; then
   echo -e "$Y Source Directory Doest not exist $N"
   exit 1
fi

if [ ! -d $DEST_DIR ]; then
   echo -e "$Y Destination Directory Does not exist $N"
   exit 1
fi


