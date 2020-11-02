#!/bin/bash
number=1
operation="*"
(tail -f pipe) |
while true; do
read string
case $string in

"+")
operation="+"
;;

"N")
operation="N"
;;

[0-9]*)
if [[ $operation == "+" ]]
then
let number=$number+$string
else
let number=$number\*$string
fi
echo "number = ${number}"
;;

"QUIT")
echo "Planned error"
killall tail
exit 0
;;

*)
echo "Input error. Wrong input"
killall tail
exit 1
esac
done
