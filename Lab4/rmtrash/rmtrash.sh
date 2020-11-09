#!/bin/bash
num=$(cat num.txt)
let num=$num+1
echo $num > num.txt
if [[ $# != 1 ]]; then
	echo "Invalid arguments number"
	exit 1
fi
if [[ ! -f $PWD/$1 ]]; then
	echo "No such file"
	exit 1
fi

if [[ ! -d ~/.trash ]]; then
	mkdir ~/.trash
fi

ln $PWD/$1 ~/.trash/$num
rm $PWD/$1
echo "$PWD/$1 $num" > ~/.trash.log
