# ubuntu-ml
Dockerfile for Machine Learning Data experiments on Ubuntu.,
This repository helps you create a [docker](https://www.docker.com/) container.
This container runs Ubuntu 14.04 (latest) with ipython notebook.
This container has:
* [NumPy](http://www.numpy.org/) and [SciPy](https://www.scipy.org/): scientific computing
* [Beautiful Soup](https://www.crummy.com/software/BeautifulSoup/): handles data
* [scikit-learn](http://scikit-learn.org/stable/): Machine Learning in Python


# Creating your docker container

First you have to install docker. Then the only thing you have to do is run
```bash
docker build -t machinelearning https://github.com/h3dema/ubuntu-ml.git
```

or

```bash
docker build -t machinelearning github.com/h3dema/ubuntu-ml
```

# Running

The following command start a machinelearning container:

```bash
docker run -it machinelearning
```

This will provide you a prompt, where you can get the container IP address and also start the jupyter notebook.
Both command are shown below:

```bash
# root@xxxxxxx:/# ifconfig eth0 | grep inet\ addr | awk -F ":" '{print $2}' | awk '{print $1}'
172.17.0.19
# root@xxxxxxx:/# jupyter notebook --allow-root --notebook-dir=/JUPYTER &
```

The last command runs the notebook, and it can be access using the IP address of eth0 interface.
In our example, the URL is https://172.170.0.19:8888.
The password to access the notebook is 'secret'.

## Get the docker container IP address from the Host

```bash
CID=$(docker run -d -p 4321 machinelearning nc -lk 4321); docker inspect $CID | grep IPAddress
```
