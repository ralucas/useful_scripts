#!/bin/bash

dir=`pwd`/$1
find=$2
replace=$3

grep -rl $find $dir | xargs sed -i '' 's/\'$find'/\'$replace'/g'

