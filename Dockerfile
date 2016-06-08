# Version 0.1.0
FROM ubuntu
MAINTAINER Jakub Jarosz "jakub.jarosz@postpro.net"

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main " > /etc/apt/sources.list.d/jdk.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886

RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN apt-get update \
    && apt-get install -y \
	build-essential \
        wget \
	oracle-java7-installer \
	oracle-java7-set-default \
    && update-java-alternatives -s java-7-oracle \
    && apt-get autoremove \
    && apt-get clean

CMD []
ENTRYPOINT ["/bin/bash"]  
    

