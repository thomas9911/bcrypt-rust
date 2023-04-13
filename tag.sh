#! /bin/bash

PROJECT_VERSION=$(sed -n 's/^  @version "\(.*\)"/\1/p' mix.exs | head -n1)
TAG="v${PROJECT_VERSION}"

git checkout main
git pull
git tag $TAG
git push origin $TAG
