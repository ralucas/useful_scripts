#!/bin/bash

if [ $1 == '--help' ]
then
  echo "      -----  How to use sed_dir: ------

    sed_dir <directory> <string-to-find> <string-to-replace>

    Example:
      sed_dir my_dir/ myName newName"
elif [ $# -lt 3 ]
then
   echo "Not enough arguments supplied"
else
  dir=`pwd`/$1
  find=$2
  replace=$3

  grep -rl $find $dir | xargs sed -i '' 's/\'$find'/\'$replace'/g'
fi
