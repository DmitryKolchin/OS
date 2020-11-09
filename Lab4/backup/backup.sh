#!/bin/bash

last_date=$(ls ~ | grep -E "^Backup-" | sort -n | tail -1 | sed "s/Backup-//")
cur_date=$(date +"%Y-%m-%d")
delta_time=$(echo "($(date -d "$cur_date" +"%s") - $(date -d "$last_date" +"%s")) / 60 / 60 / 24" | bc)
if (( $delta_time > 7 )) || [[ -z $last_date ]]; then 
	mkdir $HOME/Backup-$cur_date
	for filename in $(ls ~/source); do
		cp $HOME/source/$filename $HOME/Backup-$cur_date
	done
	files=$(ls ~/source | sed "s/^/\t/")
	echo -e "Backup $cur_date : \n${files}" >> ~/backup-report
else
	for filename in $(ls ~/source); do
		last_backup=$HOME/Backup-$last_date
		if [[ -f $last_backup/$filename ]]; then
			real_size=$(wc -c "$HOME/source/${filename}" | awk '{print $1}')
			backup_size=$( wc -c "$last_backup/$filename" | awk '{print $1}')
			delta_size=$(echo "${real_size} - ${backup_size}" | bc)
			
			if (( $delta_size != 0 )); then
				mv $last_backup/$filename $last_backup/$filename.$cur_date
				cp $HOME/source/$filename $last_backup
				report_info="${record_info}\n\tFile ${filename} updated. Previous version: ${filename}.${cur_date}."
			fi
		else
			cp $HOME/source/$filename $last_backup
			report_info="${record_info}\n\tFile $obj copied."
		fi
	done
	echo -e "Backup (${last_date}) updated:\n${report_info}" >> ~/backup-report
fi
