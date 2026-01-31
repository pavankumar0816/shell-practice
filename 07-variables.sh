#!/bin/bash

#### Special Variables ###
echo "All args passed to script: $@"
echo "Number of args passed to script: $#"
echo "Script name: $0"
echo "First arg: $1"
echo "Present working dircetory: $PWD"
echo "Who is running (current user): $USER"
echo "Home directory of current user: $HOME"
echo "PID of this script: $$"
sleep 100 & # putting the sleep command in background
echo "PID of recently executed background process: $!"
echo "All args passed to script: $*"
echo "Exit status of last executed command: $?" #0 → success,non-zero → failure

