#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 eq 0 ]
    then
        echo "$2 installation is success..."
    else    
        echo "$2 installation is failure....."
        exit
    fi         
}



if [ $USERID -ne 0 ]
then
    echo "you r not a super user"
    exit 1
else
    echo "you r super user"
fi 

