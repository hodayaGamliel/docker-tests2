#!/bin/bash

set -x

IMAGE_NAME="hodaya/run1"
SHARE_DIR=/home/ubuntu/docker-tests2/share
C_JAR_FILE="test7"
C_URL="https://backend.takipi.com"
C_SK="S10168#g3vpTbodqeT6uJcU#m+gGA6/5Pha8ycZoEEykoYfDzEK1XkV/4/tq8T4mnL0=#11c6"

docker build --build-arg JAR_FILE=$C_JAR_FILE --build-arg URL=$C_URL --build-arg SK=$SK  -t $IMAGE_NAME .

docker run -v $SHARE_DIR:/tmp/share/ $IMAGE_NAME
