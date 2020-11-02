#!/bin/bash
while [[ true ]]
do 
read string
echo $string > pipe
if [[ $string == "QUIT" ]]
then
exit 0
fi
if [[ $string != "+" && $string != "N" && ! $string =~ [0-9]+ ]]
then
exit 1
fi
done

