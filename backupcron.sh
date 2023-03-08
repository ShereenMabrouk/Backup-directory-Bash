#!/bin/bash

#Shereen Mostafa Hassan Mabrouk
# ID :6844      Group 3 Section 2 Lab2
#########################BONUS###################################
# The cron is the same as the original bash filee but without infinte loop as it repeat itself
echo Started
dir_name=$1
backup_dir_name=$2
time_interval=$3
max_n=$4

mkdir -p /home/shereen/Lab2/backupdirectory 
current_backupdir=$backup_dir_name/$( date +"%Y-%m-%d--%I-%M-%S" )

sleep $time_interval	
ls -lR $dir_name > directory-info.new
if cmp -s "directory-info.new" "directory-info.last";
then 
		echo "No Change So Far"	
else
		num_curr_dirs=$( ls $backup_dir_name | wc -l)
		if [ $num_curr_dirs -ge $max_n  ]
		then 
			
			curr_dirs=($(ls $backup_dir_name | sort))
			rm -rf $backup_dir_name/${curr_dirs[0]}
			echo "The Oldest File is deleted " 
		fi
		
	
		current_backupdir=$backup_dir_name/$( date +"%Y-%m-%d--%I-%M-%S" )

		mkdir $current_backupdir

		cp -r $dir_name $current_backupdir

		ls -lR $dir_name > directory-info.last

fi

echo The End
