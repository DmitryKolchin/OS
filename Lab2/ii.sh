#!/bin/bash
sudo ps a u -e | awk '{if($11 ~ /^\/sbin\/.*/) print $2}' 
