#!/bin/bash
 
exec 2>/dev/null # silince the warnings
 
ip=$1
 
for port in {1..65535}
do
    >/dev/tcp/$ip/$port && printf "port %d open\n" $port
done
