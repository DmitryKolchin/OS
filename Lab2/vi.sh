#!/bin/bash
grep "VmData:" /proc/*/status | sort -rnk2 | head -n 1 | sed "s/[^0-9]\+/ /g" | awk '{print "PID="$1", VmData="$2}'
