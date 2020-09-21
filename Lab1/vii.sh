#!/bin/bash
sudo grep -I -E -w -r -o -h '([[:alnum:]]+)@([[:alnum:]]+)\.([[:alnum:]]+)' /etc | tr '\n' ', ' > emails.lst
