#!/bin/bash
#set -xv
USERID=$(id -u)
if [ $USER -ne 0 ];then
   echo "ERROR:you have to have root previlises to run"
   exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ];then
   dnf install mysql -y
   if [ $? -ne 0 ]
   then
      echo "installing mysql ...FAILURE"
      exit 1
    else
       echo "installing mysql ...SUCCESS"
    fi
else 
    echo "mysql is already installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "installing git ...FAILURE"
        exit 1
    else
    echo "installing git ....SUCCESS"
    fi
fi