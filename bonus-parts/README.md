# Cron Job Backing Up Files Every Minute 

## Overview 

The following program backs up a directory automatically every minute if it has been changed.

## Configuring a cron job
1. Check the crontab file by running the following command in your home directory:

`$ cat /etc/crontab`

2. Call the following command to see all of the jobs for the user that you're logged on with:

`$ crontab -l`

3. Call the following command to edit/create a cron job:

`$ crontab -e`

4. If it's your first time creating/editing a cron job, select an editor from the list that appears (preferably nano).

5. Scroll to the bottom of the file to add your own cron job in a new line. To make it run every minute, add the following line:

` * * * * * cd yourfilepath && make target DIR=orgpath/source BACKUPDIR=backuppath/backup MAXBACKUPS=100` 

**Notes:**
- The parameters being passed after the backup-cron.sh call are:
    
    `DIR` : source directory that has list of files we need to backup (must exist)

    `BACKUPDIR` : destination directory that will have the backup (if it doesn't exist, it will be created)

    `MAXBACKUPS` : maximum number of backups needing to be reserved

- "yourfilepath" is the path where you put the file `backup-cron.sh` and `makefile`

- "orgpath" is the path where you put your source directory, and "backuppath" is the path where you want your backup directory.
 
- You should always leave an empty line at the end of your crontab file.

- The 5 asterisks in the beginning indicate "any" for the fields: minute, hour, day of month, month, day of week. By putting 5 asterisks, we are basically saying that we want our cron job to run at every minute, every hour, every day of month for every month.

## Prerequisites

1. Download `backup-cron.sh`, `prereq.sh` and `makefile` and put them in the same directory (path).

2. Change directory to the directory of the makefile.

3. Download and make prerequisites using the following command:

` $ make prereq DIR=orgpath/source BACKUPDIR=backuppath/backup`

**Notes:** 
If you get an error "Permission denied", run the following command:

`chmod u+x yourfilepath/prereq.sh`

3. Configure cron job using steps in the previous section.


## Extra usage

### Example
What should be the cron expression if I need to run this backup every 3rd Friday
of the month at 12:31 am? 

--> **Answer:** Instead of 5 asterisks at the start of the cron job, you would put:

`31 12 15,16,17,18,19,20,21 * fri`


First and second fields are minute, hour: so cron job will run at 12:31 am.

Third and fourth fields are days of month and months: so cron job can only run at days that are 15, 16, 17, 18, 19, 20, 21 of the month (possible days where a 3rd Friday can fall).

Fifth field is days of the week, by putting friday, we made the cron job run only on the 3rd Friday of every month.

