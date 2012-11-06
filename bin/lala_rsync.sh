#!/bin/sh
# testen mit --dry-run
# rsync --progress --exclude-from=/Users/tobias/.rsync/exclude --delete --dry-run -avhr  /Volumes/Datengrab/iTunes/lala/Music/ /Volumes/Lala_Backup/mp3/
rsync --progress --exclude-from=/Users/tobias/.rsync/exclude --delete -avhr  /Volumes/Datengrab/iTunes/lala/Music/ /Volumes/Lala_Backup/mp3/ | tee /Users/tobias/Desktop/rsync.log

## video copy##
# rsync --progress --exclude-from=/Users/tobias/.rsync/exclude  --dry-run -avhr  "/Volumes/Datengrab 1"/ /Volumes/Datengrab/video/

# rsync --progress -avhr  /Volumes/Datengrab/Backups.backupdb/tobstone/2011-04-09-193706/Macintosh\ HD/Users/tobias/Pictures/iPhoto\ Library/ /Users/Shared/iPhoto\ Library/ | tee /Users/tobias/Desktop/rsync.log

# rsync --progress -avhr --dry-run  /Users/tobias/Downloads/wordpress /Sites/wordpress | tee /Users/tobias/Desktop/rsync.log
