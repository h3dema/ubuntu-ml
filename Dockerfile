FROM docker.io/ubuntu:14.04

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install build-essential && \
    apt-get -y install python-setuptools python-pip python-dev && \
    apt-get -y install python-numpy python-scipy python-matplotlib ipython && \
    apt-get -y install libatlas-dev libatlas3-base
    
RUN pip install -U scikit-learn    
RUN pip install jupyter


RUN mkdir /JUPYTER
RUN jupyter notebook --notebook-dir=/JUPYTER
