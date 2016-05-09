#!/bin/bash

# ensure the repo exists
if [ -d $REPO ]; then
    pushd $REPO
    git checkout $BRANCH || exit 1
    git pull origin $BRANCH
else
    git clone https://$GITHUB_TOKEN@github.com/$GIT_USER/$REPO.git
    pushd $REPO
    git checkout $BRANCH || exit 1
fi
popd
