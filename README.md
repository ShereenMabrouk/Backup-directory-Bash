
#Backup Directory Script

##  Introduction
 This Script is written in bash , It is a backup script that backup any directory the user wants , The Backup directory will backup the directory and if the user make any change in the directory it will backup it again until the limit of maximum numbers of backup decided by the user then It will remove the oldest backup and replace it with the new backup and the program works in infinite loop .

 ## Installation 
 - The program run in linux 'Ubuntu' , The User must install ubuntu & install make instruction and cron job 
 -  the bash file extension must be **.sh** for Example bash.sh
-  The user must give the permission to this file to be excutable ny **chmod** instruction 
 - The Script runs from the terminal

## How to run backup script
1. **Without Using Makefile**
        the user must call the bash file by giving the terminal the call of bash and the name of bash file and the for arguments to run the script 
        **The four arguments are :** directory path , backup directory path , time interval , maximum number of backups
        
        ```bash
        bash backup.sh /home/shereen/Lab2/test/ /home/shereen/Lab2/backupdirectory 10 3
        ```
    The previous code backup the directory test at the backup directory then it checks every 10 seconds if there is a change in the main directory if there is a change it backup again until it reach maximum number of backups the it remove the oldest backup directory 
    ***The backup directories are stored at main backup directory with there dates of backup***

 2. **By Using Makefile**
        Only the user have to call the makefile by writing make in terminal and the function the user wants to do 
        ***Example***
        *make Do* : Do is a function that contains the calling command so it call the bash file directly

## How makefile works
makefile is built in command in linux all we have to is to install it from the terminal then we use it 

## How Cron job works
First of all the user must install cron and the user must make the service of cron start 
- There is a bash file created for cron the diffrence between cron bash file and the original bash file that I removed the infinite loop from the cron bash file as the cron create a schedualed time for it self
- To use cron we write 
       ```
            crontab -e
            ```
            then we write the calling we want inside the cron tab
            *for example*
            '''
            ```
            * * * * *  cd lab2 && ./backupcron.sh directory backupdirectory 1 3
             ```
             then the use enter ctrl+x then y then the cron will work 
         The  * * * * * Five stars means [minutes-hours-days-months-weekdays]   
        
- ***The cron expression if i need to run this backup every 3rd friday of the month at 12:31***
    ```
    31 0 15-22 * 5 cd lab2 && ./backupcron.sh directory backupdirectory 1 3
    ```

**Illustration for previous line** 
- 31 related to 31 minutes 
- 0 means 12:00 am
- 15-22 range of days in third week
- '*' means all months
- 5 means friday
then we give the cron the path of bashfile ,directory,backupdirectory,intervaltime,maxbackups
