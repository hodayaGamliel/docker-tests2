#!/bin/bash

# set -x

# HOST_URL=https://backend.takipi.com
TAKIPI_PROPERTIES_FILE="/opt/takipi/takipi.properties"
# SECRET_KEY=S12974#v+OrCVNCP5zNbq0G#wY00LeBhPNV6U1wJY94aiZHdg08YvXNO1oDlettWeS4=#42e3
JAR=https://s3.amazonaws.com/app-takipi-com/chen/scala-boom.jar
# JAR_FILE=scala-boom.jar

HOST_URL=$1
SECRET_KEY=$2
JAR_FILE=$3

function start_takipi_service()
{
  service takipi start
}

function change_host_url()
{
  HOST_URL=$1
  sed -i -e s,https://backend.takipi.com,$HOST_URL,g $TAKIPI_PROPERTIES_FILE
}

function change_secret_key()
{
  SECRET_KEY=$1
  /opt/takipi/etc/takipi-setup-secret-key $SECRET_KEY
}

function download_jar()
{
  JAR=$1
  wget $JAR
}

function run_test()
{
  JAR_FILE=$1
  nohup java -agentlib:TakipiAgent -jar $JAR_FILE &
}

function main()
{
  change_host_url $HOST_URL
  change_secret_key $SECRET_KEY
  start_takipi_service
  download_jar $JAR
  run_test $JAR_FILE
}

main $@
