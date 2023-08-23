Applog_directory_Name=/home/centos/app-logs
Date=$(date +%F)
Script_name=$0
Files_to_delete=$(find . -name "*.log" -type f -mtime +20)
echo "$Files_to_delete"