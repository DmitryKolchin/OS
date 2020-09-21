#!/bin/bash
echo 'Print 1 for nano'
echo 'Print 2 for vim'
echo 'Print 3 for links'
echo 'Print 4 for exit'
while [[ true ]] 
do
read command
case "$command" in
1)
nano
;;
2)
vi
;;
3)
links
;;
4)
exit 0
;; 
esac
done 
