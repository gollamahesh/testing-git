#!/bin/bash

Names=$@
imageid=ami-03265a0778a880afb
Instance_type=t2.micro
Security_group_id=sg-0ff50d5fb4461d993
domain_name=maheshgolla.online
for i in $@
do  
    # if [[ $i == "mongodb" || $i == "mysql" ]]
    # then
    #     echo "t3.micro"
    # else
    #     echo "t2.micro"
    # fi 
    echo "creating $i instance"
    ip_address=$(aws ec2 run-instances --image-id $imageid --instance-type $Instance_type --security-group-ids $Security_group_id --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" | jq -r '.Instances[0].PrivateIpAddress')
    echo "created $i instance and Ip address is $ip_address"
    aws route53 change-resource-record-sets --hosted-zone-id Z03394891F4L5GMFM9DG3 --change-batch '
    {
            "Comment": "CREATE/DELETE/UPSERT a record ",
            "Changes": [{
            "Action": "CREATE",
                        "ResourceRecordSet": {
                                    "Name": "'$i.$domain_name'",
                                    "Type": "A",
                                    "TTL": 300,
                                 "ResourceRecords": [{ "Value": "'$ip_address'"}]
    }}]
    }
    '   
done