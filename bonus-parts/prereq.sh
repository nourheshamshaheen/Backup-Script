if [ $# -lt 2 ]
then
	echo "PARAMETERS MISSING!"
else
	orgdir=$1
	backupdir=$2
	
	touch directory-info.last
	touch directory-info.new

	# Get initial directory info
	ls -lR $orgdir > directory-info.last

	# dateformat = '%Y-%m-%d-%H-%M-%S'
	now=$(date +'%Y-%m-%d-%H-%M-%S')
	mkdir -p "$backupdir"/"$now"
	# Copy source to destination
	cp -R "$orgdir"/* $backupdir/$now
fi
