#!/bin/bash
#set -xv
USERID=$(id -u)
VALIDATE(){
    if [  -$1 ne 0 ]
   then
      echo "$2 ...FAILURE"
      exit 1
    else
       echo "$2 ...SUCCESS"
    fi
}

if [ $USERID-ne 0 ];then
   echo "ERROR:you have to have root previlises to run"
   exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ];then
   dnf install mysql -y
   VaLIDATE $? "installing mysql"
else 
    echo "mysql is already installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "installing git"
else
    echo "git is already installed"
    
fi