FROM docker.io/ubuntu:14.04

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install build-essential && \
    apt-get -y install python-setuptools python-pip python-dev && \
    apt-get -y install python-numpy python-scipy python-matplotlib ipython && \
    apt-get -y install ipython-notebook && \
    apt-get -y install python-bs4 && \\
    apt-get -y install git

RUN pip install --upgrade pip
RUN pip install -U scikit-learn    

RUN sudo -H pip install jupyter

# create access keys
# 10 years certificate
RUN openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout mykey.key -out mycert.pem -subj "/C=BR/ST=MG/L=BH/O=Bogus/OU=IT Department/CN=machinelearning"

# create a configuration file
RUN jupyter notebook --generate-config --allow-root
RUN echo -e "c.NotebookApp.certfile = u'/mycert.pem'" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo -e "c.NotebookApp.keyfile = u'/mykey.key'" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo -e "c.NotebookApp.ip = '*'" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo -e "c.NotebookApp.open_browser = False" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo -e "c.NotebookApp.password = u'`python -c "from IPython.lib import passwd;print passwd('secret')"`'" >> /root/.jupyter/jupyter_notebook_config.py

RUN mkdir /JUPYTER
# the notebook server starts on port 8888
# the default directory is /JUPYTER
RUN jupyter notebook --allow-root --notebook-dir=/JUPYTER &
# you can access the ipython notebook using:
# http://<ip address of eth0>:8888/

RUN echo -e "You can access this container by these addresses"
RUN ifconfig eth0 | grep inet
