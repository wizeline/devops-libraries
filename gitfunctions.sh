#!/bin/bash

# ensure the repo exists
if [ -d $REPO ]; then
    pushd $REPO
    if [[  $TYPE != "DEVELOPMENT" ]]; then
        git pull
        git checkout $BRANCH || exit 1
        git pull origin $BRANCH
    fi
else
    git clone https://$GITHUB_TOKEN@github.com/$GIT_USER/$REPO.git || exit 1
    pushd $REPO
    git checkout $BRANCH || exit 1
fi
popd
