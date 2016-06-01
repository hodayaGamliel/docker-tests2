#!/bin/bash

set -x 

IMAGE_NAME="hodaya/run"
SHARE_DIR=/home/ubuntu/docker-tests2/share

#LOG_PATH=/vagrant/share
#docker build --build-arg JAR_FILE="scala-boom1.jar"  URL="https://backend.takipi.com" SK="S12974#v+OrCVNCP5zNbq0G#wY00LeBhPNV6U1wJY94aiZHdg08YvXNO1oDlettWeS4=#42e3"  -t $IMAGE_NAME .

docker build -t $IMAGE_NAME .

docker run -v $SHARE_DIR:/tmp/share/ $IMAGE_NAME
