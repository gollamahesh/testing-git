Applog_directory_name=/home/centos/app-logs
Date=$(date +%F)
Script_name=$0
Files_to_delete=$(find $Applog_directory_name -name "*.log" -type f -mtime +20)


while read line
do
    echo "$Files_to_delete"
done <<< $Files_to_delete