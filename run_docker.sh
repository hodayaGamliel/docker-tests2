#!/bin/bash

IMAGE_NAME="hodaya/run"
SHARE_DIR=/vagrant/share


LOG_PATH=/vagrant/share
docker build --build-arg JAR_FILE="scala-boom1.jar"  URL="https://backend.takipi.com" SK="S12974#v+OrCVNCP5zNbq0G#wY00LeBhPNV6U1wJY94aiZHdg08YvXNO1oDlettWeS4=#42e3"  -t $IMAGE_NAME .

docker run -v $SHARE_DIR:/tmp/test-share $IMAGE_NAME
