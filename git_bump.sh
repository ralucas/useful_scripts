#!/bin/bash -ex

NEW_TAG=$1
BRANCH=`git rev-parse --abbrev-ref HEAD`
CURR_TAG=`git describe --abbrev=0 --tags`
CURR_DIR=`pwd`

if [ -z "$CURR_TAG" ] && [ -z "$NEW_TAG" ]; then
  NEW_TAG=0.0.1
fi

if [ -z "$NEW_TAG" ]; then
  PATCH_VERSION=`echo $CURR_TAG | grep -o "[[:digit:]]$"`
  let NEW_PATCH=PATCH_VERSION+1
  NEW_TAG=`echo $CURR_TAG | sed -e s/\.[[:digit:]]$/\.${NEW_PATCH}/`
fi

if [ -a $CURR_DIR/package.json ]; then
  echo "Bumping package.json to ${NEW_TAG}"
  sed -i.bak "s/version\"\:.*/version\"\: \"${NEW_TAG}\"\,/" $CURR_DIR/package.json
#  rm $CURR_DIR/package.json.bak
fi

echo "Tagging to ${NEW_TAG}"

git add -A
git commit -m "Updating ${BRANCH}"
git push origin ${BRANCH}
git tag -a ${NEW_TAG} -m "Release ${NEW_TAG}"
git push origin --tags
