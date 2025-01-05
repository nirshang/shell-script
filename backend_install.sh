USERID=$(id -u expense)

dnf module disable nodejs -y
dnf module enable nodejs:20 -y

dnf list installed nodejs
if [ $? -ne 0 ];then
   dnf install nodejs -y
   echo "nodejs installed"
else
    echo "nodejs is already installed"
fi

if [ $USERID -ne expense ];then
    useradd expense
else
    echo "user expense already exists"
fi

cd /app
if [ $? -ne 0 ];then
   mkdir /app
else 
    echo "/app directory already exists"
fi

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip

cd /app

unzip /tmp/backend.zip

npm install