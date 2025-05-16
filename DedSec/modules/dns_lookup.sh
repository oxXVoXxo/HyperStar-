#!/bin/bash
echo -ne "Domain: "
read domain
dig $domain ANY +noall +answer
