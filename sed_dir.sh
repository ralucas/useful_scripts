#!/bin/bash

dir=`pwd`/$1
find=$2
replace=$3

for file in $dir*; do
  sed -i -e 's/'"$find"'/'"$replace"'/g' $file
done

