#!/bin/bash

BRANCH=`git rev-parse --abbrev-ref HEAD`
CURR_TAG=`git describe --tags`

if [[ -z "$CURR_TAG" ]]; then
  NEW_TAG=0.0.1
fi

if [[ -z "$NEW_TAG" ]]; then
  PATCH_VERSION=`echo $CURR_TAG | grep -o "[[:digit:]]$"`
  NEW_TAG=`echo $CURR_TAG | sed -e s/\.[[:digit:]]$/${PATCH_VERSION}/`
fi
echo "Tagging to ${NEW_TAG}"

git add -A 
git commit -m "Updating ${BRANCH}" 
git push origin ${BRANCH}
git tag -a ${NEW_TAG} -m "Release ${NEW_TAG}"
git push origin --tags
