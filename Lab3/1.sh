#!/bin/bash
today=$(date '+%d.%m.%y_%H:%M:%S')
mkdir ~/test && { echo "catalog test was created successfully" > ~/report; touch ~/test/$today ; }
ping -c1 www.net_nikogo.ru || echo "${today} error while ping command" >> ~/report
