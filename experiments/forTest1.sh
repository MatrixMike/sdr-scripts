#!/bin/bash
#for loop

for file in ./* ; do
   ls "$file"
   wc "$file"
done

