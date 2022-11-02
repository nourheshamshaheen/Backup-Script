target: ./backupd.sh	
	@if [ ! -d "$(BACKUPDIR)" ]; then \
		test -d $(BACKUPDIR) || mkdir -p $(BACKUPDIR);\
	fi
	
	@./backupd.sh $(DIR) $(BACKUPDIR) $(INTERVAL) $(MAXBACKUPS)
	
# Help Facility - Optional
help:
	@echo 'Makefile for backing up a directory automatically					'
	@echo '											'
	@echo 'Usage:											'
	@echo '   make target 			run backup bash script					'
	@echo '   make help			show this message and exit				'	 
	@echo 
	@echo 
	@echo 'Parameters:										'
	@echo '   DIR		src directory that has list of files we need to backup (must exist)	'
	@echo '   BACKUPDIR	destination directory that will have the backup			'
	@echo '   INTERVAL	time to wait between every check					'
	@echo '   MAXBACKUPS	maximum number of backups needing to be reserved			'
	@echo
	@echo
	@echo 'Examples of usage:									'
	@echo '   make target DIR=~/source BACKUPDIR=~/backup INTERVAL=30 MAXBACKUPS=10			'
	@echo '   make help										'
	@echo
