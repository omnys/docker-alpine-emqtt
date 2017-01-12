#!/bin/bash

set -ex

IMAGE_NAME=omnys/alpine-emqtt
VERSION=2.0.6

#build image
docker build -t ${IMAGE_NAME} .

#tag image with latest version
docker tag ${IMAGE_NAME}:latest ${IMAGE_NAME}:${VERSION}

#login to docker hub
# docker login
#
# #push latest and tagged images
# docker push ${IMAGE_NAME}:latest
# docker push ${IMAGE_NAME}:${VERSION}
