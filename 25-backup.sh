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

log(){
    echo -e "$(date "+%Y-%m-%d %H:%M:%S") | $1" | tee -a $LOGS_FILE
}

if [ $# -lt 2 ]; then
   USAGE
fi

if [ ! -d $SOURCE_DIR ]; then
   echo -e "$Y Source Directory: $SOURCE_DIR Doest not exist $N"
   exit 1
fi

if [ ! -d $DEST_DIR ]; then
   echo -e "$Y Destination Directory: $DEST_DIR Does not exist $N"
   exit 1
fi

## FInd the files

FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

log "Backup Started"
log "Source Directory: $SOURCE_DIR"
log "Destination Directory: $DEST_DIR"
log "Days: $DAYS"
