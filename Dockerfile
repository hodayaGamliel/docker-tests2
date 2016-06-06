# statistics , nonce and tomcat embedded
#
# Takipi
#
# Installs and runs Takipi with a Java tester

# Pull base image .
FROM java:8

MAINTAINER Hod

# Needed for Ubuntu 15.10, October 2015
RUN update-ca-certificates -f

ARG JAR_FILE=test6
ARG SK=S10330#hYkm9nIxDxbZL/Ks#UCn8QfrACntPjjwUm7rAG7mbuXjEa7w614joKUtMMeE=#ad7e
ARG URL=https://backend.takipi.com

# Get Takipi for containers
RUN echo "deb [arch=amd64] http://takipi-tfc-deb-repo.s3.amazonaws.com stable main" > /etc/apt/sources.list.d/takipi.list
RUN wget -O - http://s3.amazonaws.com/takipi-tfc-deb-repo/hello%40takipi.com.gpg.key | apt-key add -
RUN apt-get update
RUN apt-get install -y takipi

ENV PATH $PATH:/opt/takipi/bin
ENV TAKIPI_HEAP_SIZE 90m
ENV JAVA_OPTS -agentlib:TakipiAgent

# Setup Takipi key and name
RUN /opt/takipi/etc/takipi-setup-secret-key S12974#v+OrCVNCP5zNbq0G#wY00LeBhPNV6U1wJY94aiZHdg08YvXNO1oDlettWeS4=#42e3
RUN /opt/takipi/etc/takipi-setup-machine-name takipi-test

ENV D_JAR_FILE $JAR_FILE
ENV D_SK $SK
ENV D_URL $URL

RUN  rm /bin/sh && ln -s /bin/bash /bin/sh

CMD  [ "/bin/bash" , "-c" , "rm /bin/sh && ln -s /bin/bash /bin/sh  && \
     /tmp/share/run.sh $D_URL $D_SK $D_JAR_FILE && \
     sleep 10
     timeout 60 grep -q 'AHT' <(tail -f /opt/takipi/log/bugtale_service.log) && \
     sleep 5 && \
     cp -r /opt/takipi/log /tmp/takipi-logs/ /tmp/share/"]
