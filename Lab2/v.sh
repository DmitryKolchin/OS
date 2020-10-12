#!/bin/bash
ppid=0
sum_art=0
count=0
./iv.sh
while read str
do
cur_ppid=$(echo "$str" | awk -F "[/=/:]" '{print $4}')
if [[ "$ppid" -eq "$cur_ppid" ]]
then
count=$(($count+1))
sum_art=$sum_art+$(echo "$str" | awk -F "[/=/:]" '{print $6}')
else
m=$(echo "scale=5; $sum_art/$count" | bc )
count=1
sum_art=$(echo "$str" | awk -F "[/=/:]" '{print $6}' | bc)
echo 'Average_Sleeping_Children_of_ParentID='$ppid' is '$m
ppid=$cur_ppid
fi
echo "$str"
done < iv.txt
