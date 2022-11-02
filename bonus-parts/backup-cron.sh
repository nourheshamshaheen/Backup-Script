# Validate # of parameters	
if [ $# -lt 3 ]
then
	echo "PARAMETERS MISSING!"
else
	orgdir=$1
	backupdir=$2
	maxbackups=$3
	maxbackupsplus=`expr $maxbackups + 1`

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
		numbackups=$(ls $backupdir | wc -l)
			
		# Remove oldest backups if backup count > maxbackups
		# ls -t $backupdir to print files in backupdir sorted by time
		# tail -n +$maxbackups to ignore the first "maxbackups+1" lines and prints after them
		# rm -r removes directories and files due to the -r (recursive) option
		if [ $numbackups -gt $maxbackups ]
		then
			args=$(ls -t $backupdir | tail -n +$maxbackupsplus)
			for arg in $args
			do
				dir=$backupdir/$arg
				rm -r $dir
			done
		fi
	fi 
fi
