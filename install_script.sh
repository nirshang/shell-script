#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ];then
   echo "ERROR:to run this you must have sudo previlizes"
   exit 1
fi
dnf install mysql -y
