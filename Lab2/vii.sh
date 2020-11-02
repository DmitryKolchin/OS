#!/bin/bash
for x in $(ps -Ao pid,command | tail -n +2 | awk '{print $1":"$2}')
do
pid=$(echo $x | awk -F ":" '{print $1}')
commmand=$(echo $x | awk -F ":" '{print $2}')
f="/proc/"$pid
if [ -f $f/io ]
then
rbytes=$(sudo grep -h "read_bytes:" $f/io | sed "s/[^0-9]*//")
echo "$pid $commmand $rbytes"
fi
done | sort -nk1 > before_delay.txt

sleep 1m

for x in $(ps -Ao pid,command | tail -n +2 | awk '{print $1":"$2}')
do
pid=$(echo $x | awk -F ":" '{print $1}')
commmand=$(echo $x | awk -F ":" '{print $2}')
f="/proc/"$pid
if [ -f $f/io ]
then
rbytes=$(sudo grep -h "read_bytes:" $f/io | sed "s/[^0-9]*//")
echo "$pid $commmand $rbytes"
fi
done | sort -nk1 > after_delay.txt

cat after_delay.txt | while read str
do
pid=$(echo "$str" | awk '{print $1}')
oldmem=$(echo "$str" | awk '{print $3}')
cmd=$(echo "$str" |awk '{print $2}')
newmem=$(cat before_delay.txt | awk -v id="$pid" '{if ($1 == id) print $3}')
memdiff=$(echo "$newmem-$oldmem" | bc )
echo $pid":"$cmd":"$memdiff
done | sort -t ':' -nrk3 | head -n 3
