#!/bin/bash

TIMESTAMP=$(date)

echo "Script executed at: $TIMESTAMP"

starttime=$(date +%s)
echo "Script executed at: $starttime"
sleep 5
endtime=$(date +%s)
echo "Script ended at: $endtime"

