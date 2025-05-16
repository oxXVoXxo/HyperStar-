#!/bin/bash
echo -ne "Enter domain: "
read domain
whois $domain | tee logs/whois_$(date +%s).log
