#!/bin/bash
echo -ne "Enter network (e.g. 192.168.1): "
read net
for i in $(seq 1 254); do
  ping -c 1 -W 1 $net.$i &> /dev/null && echo "[$net.$i] is online"
done
