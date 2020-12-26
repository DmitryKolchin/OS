#!/bin/bash
s=''
echo $s > top_checker.txt
while [[ true ]]; do
	top -b >> top_checker.txt
	echo '\n' >> top_checker.txt
	sleep 1
done
