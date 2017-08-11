FROM docker.io/ubuntu:14.04

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install build-essential && \
    apt-get -y install python-setuptools python-pip python-dev && \
    apt-get -y install python-numpy python-scipy python-matplotlib ipython && \
    apt-get -y install ipython-notebook

#apt-get -y install python-bs4 && \\
#    apt-get -y install git

RUN pip install --upgrade pip
RUN pip install -U scikit-learn    

RUN sudo -H pip install jupyter

RUN mkdir /JUPYTER

# create access keys
# 10 years certificate
RUN openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout mykey.key -out mycert.pem -subj "/C=BR/ST=MG/L=BH/O=Bogus/OU=IT Department/CN=machinelearning"

# create a configuration file
RUN jupyter notebook --generate-config --allow-root
RUN echo "c.NotebookApp.certfile = u'/mycert.pem'" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.keyfile = u'/mykey.key'" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.ip = '*'" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.open_browser = False" >> /root/.jupyter/jupyter_notebook_config.py
RUN echo "c.NotebookApp.password = u'`python -c "from IPython.lib import passwd;print passwd('secret')"`'" >> /root/.jupyter/jupyter_notebook_config.py

RUN echo -e "\n\n\nYou can access this container by these addresses"
RUN ifconfig eth0 | grep inet

RUN cat /root/.jupyter/jupyter_notebook_config.py

# Add Tini. Tini operates as a process subreaper for jupyter. This prevents
# kernel crashes.
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

EXPOSE 8888
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root", "-notebook-dir=/JUPYTER"]

