#!/bin/bash

# Syncs ~/Documents to GUSTAVO, the happy external drive. Add
#	source ~/.gustavo.sh
# to ~/.bashrc and/or ~/.zshrc
# If using zsh, add
#	HOSTNAME = $HOST
# to .zshrc

function gustavo() {

	# save current directory
	MY_DIR=$PWD

	# flashdrive name
	DRIVENAME="GUSTAVO_SECURE"

	# flashdrive path
	DRIVEPATH=/media/$USER/$DRIVENAME

	# remote repository
	REMOTE_REPO=$DRIVEPATH/sdoc/sdoc.git

	# local repository
	LOCAL_REPO=/home/$USER/Documents

	# check if drive is mounted
	if [[ -d $REMOTE_REPO ]]
	then

		# save list of programs manually installed with apt
		FILENAME=$LOCAL_REPO/Recovery/apt/apt_list_$HOSTNAME.txt
		apt-mark showmanual > $FILENAME

		# sync secure documents
		cd /home/$USER/Documents
		echo "Pulling to $HOSTNAME from $DRIVENAME..."
		git pull -v
		git add -A -v
		git commit -m "Automatic sync made from $HOSTNAME"
		echo "Pushing to $DRIVENAME from $HOSTNAME..."
		git push -v

		# delete trash on flashdrive
		echo "Emptying trash on $DRIVENAME..."
		TRASH_DIR=$DRIVEPATH/.Trash-1000
		if [[ -d $TRASH_DIR ]]
		then
			rm -rf -v $TRASH_DIR
		else
			echo "No unsecure trash to delete"
		fi

		echo "Done!"

	else
		echo "$DRIVENAME has gone missing!"
	fi

	# return to original directory
	cd $MY_DIR
}
