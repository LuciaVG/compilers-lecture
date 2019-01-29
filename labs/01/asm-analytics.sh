#!/bin/bash

echo 'Hi, this is the output of the analysis:'

cat $1 | awk -v RS= '/^[[:xdigit:]]+ <[a-z|0-9|A-Z]+>/' | cut -b 33- | cut -d' ' -f1 | awk '/^[a-z|A-Z]+[0-9]*$/{print $1}'| sort | uniq -c | awk 'BEGIN {print "	The instructions in this object file are:\n"}{print "		",$2, "	: Executed ", $1, "times"} END {print "\n			A total of: ", NR, "\n"}'

cat $1 | awk -v RS= '/^[[:xdigit:]]+ <[a-z|0-9|A-Z]+>/' | awk 'BEGIN {print "	The instructions in this object file are:"} /^[0-9|a-z]{16}/{print "		", $2, "	Located at ", $1 }' 

