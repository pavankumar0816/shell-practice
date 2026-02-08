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

log(){
    echo -e "$(date "+%Y-%m-%d %H:%M:%S") | $1" | tee -a $LOGS_FILE
}

if [ $userid -ne 0 ]; then
    -e "$R Please run this script with root user access $N" | tee -a $LOGS_FILE
   exit 1
fi

mkdir -p $LOGS_FOLDER

USAGE(){
    log -e "$R USAGE:: sudo backup <source_DIR> <DEST_DIR> <DAYS>[default 14 days] $N"
    exit 1
}

 

if [ $# -lt 2 ]; then
   USAGE
fi

if [ ! -d $SOURCE_DIR ]; then
   log -e "$Y Source Directory: $SOURCE_DIR Doest not exist $N"
   exit 1
fi

if [ ! -d $DEST_DIR ]; then
   log -e "$Y Destination Directory: $DEST_DIR Does not exist $N"
   exit 1
fi

## FInd the files

FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

log "Backup Started"
log "Source Directory: $SOURCE_DIR"
log "Destination Directory: $DEST_DIR"
log "Days: $DAYS"

if [ -z "${FILES}" ]; then
    log "No files to Archive $Y SKIPPING $N"
else
        # app-logs-timestamp.tar.gz
        log "Files found to Archive: $FILES"
        TIMESTAMP=$(date +%F-%H-%M-%S)
        ZIP_FILE_NAME=$DEST_DIR/app-logs-$TIMESTAMP.tar.gz
        log "Archieve name: $ZIP_FILE_NAME"
        tar -zcvf $ZIP_FILE_NAME $(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS) 

        # Check archieve success or not
        if [ -f $ZIP_FILE_NAME ]; then
            log "Archeival is ... $G SUCCESS $N"

            while IFS= read -r filepath; do
            # Process each line here
            log "Deleting File: $filepath"
            rm -f $filepath
            log "Deleted file: $filepath"
            done <<< $FILES
        else
            log "Archeival is ... $R FAILURE $N"
            exit 1   
        fi
fi