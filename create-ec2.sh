#!/bin/bash

Names=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")

for i in "${Names[@]}"
do  
    if [[ $i == "mongodb" || $i == "mysql" ]]
    then
        echo "t3.micro"
    else
        echo "t2.micro"
    fi 
    echo "creating $i instance"

done