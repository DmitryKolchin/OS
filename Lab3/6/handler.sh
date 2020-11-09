#!/bin/bash
number=1
operation="+"
extra_num=2
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

sigcont() {
	operation="-"
}

sigpwr() {
	if [[ "$extra_num" -eq 5 ]]
	then
	extra_num=2
	else
	extra_num=5
	fi
}

trap 'sigterm' SIGTERM
trap 'usr1' USR1
trap 'usr2' USR2
trap 'sigcont' SIGCONT
trap 'sigpwr' SIGPWR

while true; do
	case "$operation" in
		"+")
			let number=$number+$extra_num
		;;
		"*")
			let number=$number\*$extra_num
		;;
		"-")
			let number=$number-$extra_num
		;;
			
	esac
	sleep 1
	echo $number
done
