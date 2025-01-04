#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscrip-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"


echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1 
fi

for package in $@
do 
   dnf list installed $package &>>LOG_FILE_NAME
   if [ $? -ne 0 ]
   then
       dnf install $package -y &>>LOG_FILE_NAME
       if [ $? -ne 0 ]
       then 
           echo "$package installing ....$R Failure $N"
        else 
            echo "$package installing ....$G Success $N"
    else
        echo "$package is already ....$Y INSTALLED $N"
done