#!/bin/bash

# Read IP addresses from a file
while read ip; do
    ping -c 1 "$ip" &> /dev/null && echo "$ip is reachable" || echo "$ip is not reachable"
done < "ips.txt"