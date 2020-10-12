#!/bin/bash
man bash | grep -i -o  "[a-zA-Z]\{4\}[a-zA-Z]*" | tr "[:upper:]" "[:lower:]" | sort | uniq -c | sort -r -n | head --lines=3



