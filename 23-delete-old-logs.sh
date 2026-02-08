#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_DIR=/home/ec2-user/app-logs
LOGS_FILES="$LOGS_DIR/$0.log"

if [ ! -d $LOGS_DIR ]; then
     echo -e "$LOGS_DIR does not exists"
     exit 1
fi

g
# echo "$FILES_TO_DELETE"

while IFS= read -r filepath; do
# Process each line here
echo "Deleting File: $filepath"
rm -f $filepath
echo "Deleted file: $filepath"
done <<< $FILES_TO_DELETE