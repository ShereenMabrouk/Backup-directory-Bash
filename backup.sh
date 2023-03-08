#!/bin/bash

#Shereen Mostafa Hassan Mabrouk
# ID :6844      Group 3 Section 2 Lab2
#################################*Code is well commented*################################# 
#print that the code is started to run 
echo Script is Started
# The four arguments required for program
dir_name=$1
backup_dir_name=$2
time_interval=$3
max_n=$4
# Check if the four arguments are not entered it will print error then rxit the script
if [ -z $max_n ] && [ -z $time_interval ] && [ -z $backup_dir_name] && [ -z $dir_name ] 
then
	echo  error
	exit 1
fi
# The four arguments are printed in the terminal
echo "dir to back up is $dir_name"
echo "backup location is $backup_dir_name"
echo "time interval is $time_interval"
echo "Max. no. of backups is $max_n"
#In each time in backup a backup  file  will name with the current date at the main backup directory
current_backupdir=$backup_dir_name/$( date +"%Y-%m-%d--%I-%M-%S" )
echo $current_backupdir

mkdir $current_backupdir
#copy the directory in backup dir 
cp -r $dir_name $current_backupdir
#list the directory in text file named info directory.last
ls -lR $dir_name > directory-info.last
#pput the dirs in sorted list

num_curr_dirs=$( ls $backup_dir_name | wc -l)
echo $num_curr_dirs

curr_dirs=($(ls $backup_dir_name | sort))

echo ${curr_dirs[0]}

#infinite loop to print 
while true;do 
	sleep $time_interval
	#list directory content in directory.info.new
	ls -lR $dir_name > directory-info.new
	#compare the two text files info.last and info.new
	if cmp -s "directory-info.new" "directory-info.last";
	then 
		echo "No Change So Far"	
	else
		#if the two text files are not the same check the number of backups done before 		 first
		num_curr_dirs=$( ls $backup_dir_name | wc -l)
		if [ $num_curr_dirs -ge $max_n  ]
		then 
			
			curr_dirs=($(ls $backup_dir_name | sort))
			# remove the oldest backup
			rm -rf $backup_dir_name/${curr_dirs[0]}
			echo "The Oldest File is deleted " 
			
		fi
		
		#Repeat the sequence everytime
		current_backupdir=$backup_dir_name/$( date +"%Y-%m-%d--%I-%M-%S" )
		echo $current_backupdir

		mkdir $current_backupdir

		cp -r $dir_name $current_backupdir

		ls -lR $dir_name > directory-info.last

	fi
		
done

echo Script Ended

