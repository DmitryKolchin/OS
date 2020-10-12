#!/bin/bash
> iv.txt
for pid in $(ps -Ao pid | tail -n +2)
do
address="/proc/"$pid
ppid=$(grep -s "PPid" $address/status | awk '{print $2}')
if [[ -z $ppid ]]
then ppid=0
fi
sum_exec_runtime=$(grep -s "se.sum_exec_runtime" $address/sched | awk '{print $3}')
nr_switches=$(grep -s "nr_switches" $address/sched | awk '{print $3}')
if [[ -z $nr_switches || -z $sum_exec_runtime ]]
then art=0
else
art=$(echo "scale=4; $sum_exec_runtime/$nr_switches" | bc)
fi
echo "$ppid $pid $art"
done | sort -n | awk '{print "ProcessID="$2" : Parent_ProcessID="$1" : Average_Running_Time="$3}' >> iv.txt
