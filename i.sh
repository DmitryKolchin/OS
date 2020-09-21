#!/bin/bash
a=$1
if [[ $2 -ge $1 ]]
then a=$2
fi
if [[ $3 -ge "$a" ]]
then a=$3
fi
echo "$a"
exit 0

