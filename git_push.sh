#!/bin/bash

dir=$1
message=$2

cd $dir
git add -A
git commit -m $message
git push $remote $branch
echo Pushed $dir on branch: $branch to remote: $remote >> /var/log/git_push.log

