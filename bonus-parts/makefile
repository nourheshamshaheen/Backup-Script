target: ./backup-cron.sh	
	@if [ ! -d "$(BACKUPDIR)" ]; then \
		test -d $(BACKUPDIR) || mkdir -p $(BACKUPDIR);\
	fi
	
	@./backup-cron.sh $(DIR) $(BACKUPDIR) $(MAXBACKUPS)
	
	
prereq: ./prereq.sh
	@if [ ! -d "$(BACKUPDIR)" ]; then \
		test -d $(BACKUPDIR) || mkdir -p $(BACKUPDIR);\
	fi
	@./prereq.sh $(DIR) $(BACKUPDIR)
	

	
	
	
