FROM docker.io/ubuntu:14.04

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install python-numpy python-scipy python-matplotlib ipython && \
    apt-get -y install python-pip python-dev
    
