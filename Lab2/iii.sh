#!/bin/bash 
sudo ps a u -e | awk '{print $9, $2}' | sort -rn | head --lines=1 | awk '{print $2}'
