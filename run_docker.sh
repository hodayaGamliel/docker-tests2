#!/bin/bash

set -x

IMAGE_NAME="hodaya/run1"
SHARE_DIR=/home/ubuntu/docker-tests2/share

#LOG_PATH=/vagrant/share
docker build --build-arg JAR_FILE="test7"  URL="https://backend.takipi.com" SK="S10168#g3vpTbodqeT6uJcU#m+gGA6/5Pha8ycZoEEykoYfDzEK1XkV/4/tq8T4mnL0=#11c6"  -t $IMAGE_NAME .

# docker build -t $IMAGE_NAME .

docker run -v $SHARE_DIR:/tmp/share/ $IMAGE_NAME
