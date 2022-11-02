#!/bin/sh

# parameters: 
	# dir backupdir interval maxbackups
			
# Validate # of parameters	
if [ $# -lt 4 ]
then
	echo "PARAMETERS MISSING!"
	echo "Call \"make help\" to get help!"   # note to self: add a help function in makefile
else
	# Assign each parameter to a variable	
	orgdir=$1
	backupdir=$2
	interval=$3
	maxbackups=$4

	# Initialize a variable w/ value = maxbackups + 1
	maxbackupsplus=`expr $maxbackups + 1`

	# Create directory info files
	touch directory-info.last
	touch directory-info.new

	# Get initial directory info
	ls -lR $orgdir > directory-info.last

	# dateformat = '%Y-%m-%d-%H-%M-%S'
	now=$(date +'%Y-%m-%d-%H-%M-%S')
	mkdir -p "$backupdir"/"$now"
	# Copy source to destination
	cp -R "$orgdir"/* $backupdir/$now


	# Loop forever
	while :
	do
		sleep $interval
		ls -lR $orgdir > directory-info.new
		# Compare prev and current info file
		# Use --silent option to output nothing and yield exit status only
		if cmp --silent -- "directory-info.last" "directory-info.new"
		then
	  		echo "No update"		
		else
	  		now=$(date +'%Y-%m-%d-%H-%M-%S')
			mkdir -p $backupdir/$now
			cp -R "$orgdir"/* "$backupdir"/"$now"
			cp directory-info.new directory-info.last
			
			#count number of dirs in backup
			numbackups=$(ls $backupdir | wc -l)
			
			# Remove oldest backups if backup count > maxbackups
			# ls -t $backupdir to print files in backupdir sorted by time
			# tail -n +$maxbackups to ignore the first "maxbackups+1" lines and prints after them
			# rm -r removes directories and files due to the -r (recursive) option
			if [ $numbackups -gt $maxbackups ]
			then
				echo "MAX BACKUPS REACHED. Deleting old backups..."
				args=$(ls -t $backupdir | tail -n +$maxbackupsplus)
				for arg in $args
				do
					dir=$backupdir/$arg
					rm -r $dir
				done
			fi
		fi 
	done	 

fi
