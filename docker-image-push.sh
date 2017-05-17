#!/bin/bash

set -ex

IMAGE_NAME=omnys/alpine-emqtt
VERSION=2.1.2


read -p "Did you update VERSION value and commited code? Y to continue, CTRL-C to abort." -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  #build image
  docker build -t ${IMAGE_NAME} .

  #tag image with latest version
  docker tag ${IMAGE_NAME}:latest ${IMAGE_NAME}:${VERSION}

  #push tags
  git push --tags

  #login to docker hub
  # docker login
  #
  # #push latest and tagged images
  # docker push ${IMAGE_NAME}:latest
  # docker push ${IMAGE_NAME}:${VERSION}
fi
