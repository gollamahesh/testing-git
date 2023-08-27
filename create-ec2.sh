#!/bin/bash

Names=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")
imageid=ami-03265a0778a880afb
$Instance_type=t2.micro
$Security_group_id=sg-0ff50d5fb4461d993
for i in "${Names[@]}"
do  
    # if [[ $i == "mongodb" || $i == "mysql" ]]
    # then
    #     echo "t3.micro"
    # else
    #     echo "t2.micro"
    # fi 
    echo "creating $i instance"
    aws ec2 run-instances --image-id $imageid --instance-type $Instance_type --security-group-ids $Security_group_id --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]"
done