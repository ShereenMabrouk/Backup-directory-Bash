#Shereen Mostafa Hassan Mabrouk
# ID :6844      Group 3 Section 2 Lab2
###########################*MAKEFILE*########################################


Do: directory
	bash backup.sh /home/shereen/Lab2/test/ /home/shereen/Lab2/backupdirectory 1 3
 
   
directory: 
	mkdir -p /home/shereen/Lab2/backupdirectory 
	
deactivate: 
	@service cron stop
	
start : 
	@service cron start

status : 
	@service cron status
   
cron: 
	bash backupcron.sh /home/shereen/Lab2/test/ /home/shereen/Lab2/backupdirectory 1 3
   
   
 
