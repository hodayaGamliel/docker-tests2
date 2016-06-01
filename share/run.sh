#!/bin/bash

# set -x

HOST_URL=https://backend.takipi.com
TAKIPI_PROPERTIES_FILE="/opt/takipi/takipi.properties"
SECRET_KEY=S10330#hYkm9nIxDxbZL/Ks#UCn8QfrACntPjjwUm7rAG7mbuXjEa7w614joKUtMMeE=#ad7e
JAR=https://s3.amazonaws.com/app-takipi-com/chen/scala-boom.jar
JAR_FILE=/tmp/share/jar_files/test6.jar

# HOST_URL=$1
# SECRET_KEY=$2
# JAR_FILE=$3

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

function run_test()
{
  JAR_FILE=$1
  # nohup java -agentlib:TakipiAgent -jar $JAR_FILE &
  java -jar $JAR_FILE
}

function main()
{
  change_host_url $HOST_URL
  change_secret_key $SECRET_KEY
  start_takipi_service
  run_test $JAR_FILE
}

main $@
