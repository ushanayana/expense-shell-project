#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
VALIDATE(){
    if [ $1 -eq 0 ]
    then 
        echo -e "$G $2 is success.....$N"
    else 
        echo -e "$R $2 is Failure.....$N"
        exit 1    
}


if [ $USERID -ne 0 ]
then
    echo -e "$Y you r not a super user $N"
    exit 1
else
    echo -e "$R you r super user $N"
fi 

dnf install mysql -y &>>LOGFILE
VALIDATE $? "Installing mysql"

