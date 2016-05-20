#!/bin/bash
echo 'config file: ' $1
source $1
db_user=$(awk -F "=" '/username/ {print $2}' $dir_to_backup/db.ini)
db_user="${db_user%\"}"
db_user="${db_user# \"}"
db_pwd=$(awk -F "=" '/password/ {print $2}' $dir_to_backup/db.ini)
db_pwd="${db_pwd%\"}"
db_pwd="${db_pwd# \"}"
db_name=$(awk -F "=" '/dbname/ {print $2}' $dir_to_backup/db.ini)
db_name="${db_name%\"}"
db_name="${db_name# \"}"
mkdir -p _backups/$save_dir
mysqldump -u $db_user -p$db_pwd $db_name > _backups/$save_dir/db_backup.sql
zip -r _backups/$save_dir/directory.zip $dir_to_backup 
