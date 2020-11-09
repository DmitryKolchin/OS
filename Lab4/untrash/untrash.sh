#!/bin/bash

untrash() {
	directory=$(echo $1 | awk 'BEGIN{FS=OFS="/"}; {$NF=""; print $0}')
	filename=$(echo $1 | awk 'BEGIN{FS="/"}; {print $NF}')
	if [[ ! -d $directory ]]; then
		echo "Directory ${directory} no longer exists. ${new_name} will be created in home dir"
		if [[ -f $HOME/$filename ]]; then
			read -p "File ${filename} is already exists in home dir. Please pick another name" new_filename
			ln ~/.trash/$2 $home/$new_filename
			rm ~/.trash/$2 
		else 
			ln ~/.trash/$2 $home/$filename
			rm ~/.trash/$2 
		fi
	else
		if [[ -f $directory/$filename ]]; then
			read -p "File ${filename} is already exists in ${directory}. Please pick another name" new_filename
			ln ~/.trash/$2 $directory/$new_filename
			rm ~/.trash/$2 
		else 
			ln ~/.trash/$2 $directory/$filename
			rm ~/.trash/$2 
		fi
	fi
}

if [[ $# != 1 ]]; then
	echo "Invalid arguments number"
	exit 1
fi

if [[ ! -d ~/.trash ]]; then
	echo "Trash directory is not created. Please create trash directory"
	exit 1
fi

if [[ ! -f ~/.trash.log ]]; then
	echo "Trash.log file is not created. Please create trash.log file"
	exit 1
fi

if [[ -z $(grep $1 ~/.trash.log) ]]; then
	echo "No logs on this file found"
	exit 1
fi

for trashlog in $(grep $1 ~/.trash.log | awk '{print $1}'); do
	filepath=$(echo $trashlog | sed 's/ *$//') 
	lognum=$(grep $trashlog ~/.trash.log | awk '{print $2}')
	read -p "Untrash ${filepath}? [Y/N] " answer
	case $answer in
		"Y")
			untrash $filepath $lognum
			#cat ~/.trash.log | grep -v $trashlog > ~/.trash.log
		;;
		"N")
			continue
		;;
		*)
			echo "Bad input"
			exit 1
		;;
	esac
done
