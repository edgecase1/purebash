#!/bin/bash -eu
while read line; do 
    # skip comments
    if [[ "$line" =~ ^\# ]] ; then
        continue
    fi
    # search for ipv4 addresses
    if [[ "$line" =~ [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} ]] ; then
        printf "%s\n" "$line"
    fi
    # search for words
    if [[ "$line" =~ password|key|flag ]] ; then
        printf "%s\n" "$line"
    fi
done <$1
