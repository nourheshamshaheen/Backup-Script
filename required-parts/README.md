# Shell Script to Backup a Directory
## Overview 

The following program backs up automatically a directory once it has been changed and once a certain time determined by the user has passed.

## Prerequisites
Put `makefile` and `backupd.sh` files in a directory together and run make in that directory.

No other libraries or files needed.


## Usage
### `make target`
If the user wants to backup the contents of the path `~/source/` into a directory inside the path `~/backup/` once changed automatically, the user runs the following command in the directory containing the makefile and bash script with the parameters they want.

`$ make target DIR=~/source BACKUPDIR=~/backup INTERVAL=10 MAXBACKUPS=100`

In the previous example, each 10 seconds (the value of the variable `INTERVAL`, the program will check whether the files in `~/source/` have been modified. If they have, the program creates a directory in the `~/backup/` directory and names it with the current date and time.

Once the backup directory has been filled with more than 100 directories (the value of the variable `MAXBACKUPS`), only the most recent 100 directories will be kept, and all previous ones will be erased.

#### Parameters:
The following parameters must be passed with `make target` or else the program will raise a warning and exit!

`DIR` : source directory that has list of files we need to backup (must exist)

`BACKUPDIR` : destination directory that will have the backup (if it doesn't exist, it will be created)

`INTERVAL` : time to wait between every check

`MAXBACKUPS` : maximum number of backups needing to be reserved

### `make help`
The goal of the following line is to display the possible commands, as well as the parameters' name and usage to the user. It's an extra functionality.
`$ make help`
