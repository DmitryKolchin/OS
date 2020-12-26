#!/bin/bash

array=()
additional_array=(1 2 3 4 5 6 7 8 9 10)
c=0
echo "" > report.log

while [[ "${#array[@]}" -le "$1" ]]; do
	array+=(${additional_array[@]})

done
