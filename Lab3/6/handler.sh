#!/bin/bash
number=1
operation="+"

sigterm() {
	echo "quit"
	exit 0
}

usr1() {
	operation="+"
}

usr2() {
	operation="*"
}

trap 'sigterm' SIGTERM
trap 'usr1' USR1
trap 'usr2' USR2

while true; do
	case "$operation" in
		"+")
			let number=$number+2
		;;
		"*")
			let number=$number\*2
		;;
	esac
	sleep 1
	echo $number
done
