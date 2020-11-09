#!/bin/bash
while true; do
read string
case "$string" in

"TERM")
kill -SIGTERM $1
exit 0
;;

"+")
kill -USR1 $1
;;

"*")
kill -USR2 $1
;;

"-")
kill -SIGCONT $1
;;

"C")
kill -SIGPWR $1
;;

*)
continue
;;

esac
done
