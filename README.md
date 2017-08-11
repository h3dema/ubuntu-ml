# ubuntu-ml
Dockerfile for Machine Learning Data experiments on Ubuntu.,
This repository helps you create a [docker](https://www.docker.com/) container.
This container runs Ubuntu 14.04 (latest) with ipython notebook.
This container has:
* [http://www.numpy.org/](NumPy) and [https://www.scipy.org/](SciPy): scientific computing
* [https://www.crummy.com/software/BeautifulSoup/](Beautiful Soup): handles data


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
