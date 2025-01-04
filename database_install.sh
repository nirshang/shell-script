USERID=(id -u)
NEW_ROOT_PASSWORD="ExpenseApp@1"

if [ $USERID -ne 0 ]
then
    echo "you do not have root permission to run this"
    exit 1
fi

dnf list installed mysql-server
if [ $? -ne 0 ]
then
    dnf install mysql-server -y
else
    echo "Mysql already installed"
fi

systemctl enable mysqld

systemctl start mysqld


# Run MySQL commands to set the root password and secure the installation
mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${NEW_ROOT_PASSWORD}';
DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';
FLUSH PRIVILEGES;
EOF

# Output success message
echo "MySQL root password set and installation secured."
