#!/bin/bash
shopt -s dotglob

dir=$1
regex="\.git"

projectsdir="/Users/richardlucas/Projects"

for projects in $projectsdir/*; do
  projdir=$projects
  subdirs="$(ls -al $projdir | grep -o \.git)"
  if [[ $subdirs =~ $regex ]]
    then
      status="$(cd $projdir; git status | grep 'nothing to commit')"
      if [[ $status != "" ]]
        then
          echo $projects is clean
        else
          git_status="$(cd $projdir; git status)"
          branch="$(cd $projdir; git branch | grep -o [[:alnum:]] | tr -d \n[:space:])"
          #git push origin $branch
          #echo Pushed: $project to $branch
          echo Project $projects on $branch is ready to be pushed
          echo $git_status
          touch $HOME/git_to_push.txt
          echo $projects $git_status >> $HOME/git_to_push.txt
      fi
  fi
done
