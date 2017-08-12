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

```bash
docker run -it machinelearning
```

The notebook is going to running and can be access using the IP address of eth0 interface.
The password to access the notebook is 'secret'.

## Get the docker container IP address

```bash
CID=$(docker run -d -p 4321 machinelearning nc -lk 4321);
docker inspect $CID | grep IPAddress
```
