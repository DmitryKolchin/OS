#!/bin/bash

array=()
additional_array=(1 2 3 4 5 6 7 8 9 10)
c=0
echo "" > report.log

while true; do
	array+=(${additional_array[@]})
	let c++
	if [[ $c == 100000 ]]; then
		echo "${#array[@]}"
		c=0
		echo "${#array[@]}" >> report.log
	fi
done
