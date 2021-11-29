#!/bin/bash
mkdir sqli
for i in $(cat $2) ; do
  cat $1 | grep "=" | qsreplace "$i" >> sqli
  ffuf -u FUZZ -w sqli -s -ft "<5000" | tee -a sqli/vulnSqli.txt
  rm sqli
done
