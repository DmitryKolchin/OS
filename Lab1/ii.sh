#!/bin/bash
q='q'
answer=''
while [[ true ]]
do
read a
if [[ "$a" == "$q" ]]
then break
fi
answer="$answer""$a"
done
echo "$answer"
exit 0

