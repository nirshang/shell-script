USERID=$(id -u)

#Check_user

if [ $USERID -ne 0 ]
then
    echo "Error: This command has to be run with superuser privileges (under the root user on most systems)"
    exit 1
fi

#checking and installing mysql-server

dnf list installed mysql-server
if [ $? -ne 0 ];
then
    dnf install mysql-server -y
else
    echo "Mysql already installed"
fi

systemctl enable mysqld

systemctl start mysqld

mysql -h 54.89.41.115 -u root -pExpenseApp@1 -e 'show databases;

if [ $? -ne 0 ]
then
    echo "MySQL Root password not setup"
    mysql_secure_installation --set-root-pass ExpenseApp@1
    
else
    echo -e "MySQL Root password already setup ... $Y SKIPPING $N"
fi
