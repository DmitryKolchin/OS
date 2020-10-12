#!/bin/bash
sudo ps a u -e | awk '$1=="zhaba" {print}' | wc -l 
sudo ps a u -e | awk '$1=="zhaba" {print $2":"$11}' 
