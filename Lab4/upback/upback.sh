#!/bin/bash

last_date=$(ls ~ | grep -E "^Backup-" | sort -n | tail -1 | sed 's/^Backup-//')
last_backup=$HOME/Backup-$last_date

if [[ -z $last_backup ]]; then
	echo "No backup data"
	exit 1
fi

if [[ ! -d ~/restore ]]; then
	mkdir ~/restore
fi

for filename in $(ls $last_backup | grep -Ev "\.[0-9]{4}-[0-9]{2}-[0-9]{2}$"); do
	cp $last_backup/$filename $HOME/restore/$filename
done
