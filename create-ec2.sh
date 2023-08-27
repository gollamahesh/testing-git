#!/bin/bash

Names=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")

for i in ${Names[@]}
do  
    echo "Name is : $i"
done