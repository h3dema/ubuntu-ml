FROM docker.io/ubuntu:14.04

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install build-essential && \
    apt-get -y install python-setuptools python-pip python-dev && \
    apt-get -y install python-numpy python-scipy python-matplotlib ipython && \
    apt-get -y install ipython-notebook && \
    apt-get -y install python-bs4

RUN pip install --upgrade pip
RUN pip install -U scikit-learn    

sudo -H pip install jupyter

mkdir /JUPYTER
# the notebook server starts on port 8888
# the default directory is /JUPYTER
jupyter notebook --allow-root --notebook-dir=/JUPYTER &
# you can access the ipython notebook using:
# http://localhost:8888/

