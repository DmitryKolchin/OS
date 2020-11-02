#!/bin/bash
./endless_cycle.sh& pid0=$!
./endless_cycle.sh& pid1=$!
./endless_cycle.sh& pid2=$!
renice +10 -p $pid0
kill $pid2

