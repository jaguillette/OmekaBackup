#!/bin/bash
echo 'config file: ' $1
source $1
echo 'db name: ' $db_name
mkdir -p _backups/$save_dir
mysqldump -u root -p $db_name > _backups/$save_dir/db_backup.sql
zip -r _backups/$save_dir/directory.zip $dir_to_backup 
