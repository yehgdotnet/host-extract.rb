#!/usr/bin/env bash 
echo ----------------------------------------------
echo Extracting IP/Domain Patterns from $1 
echo ----------------------------------------------
echo
for line in $(cat $1); do ruby host-extract.rb -a -v $line; done
