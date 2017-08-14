#!/bin/sh
#get Anaconda
wget -c https://repo.continuum.io/archive/Anaconda2-4.0.0-Linux-x86_64.sh

# Run Anaconda2 v4.0.0 installer.
bash ./Anaconda2-4.0.0-Linux-x86_64.sh

# Create a new conda environment with Python 2.7.x
conda create -n gl-env python=2.7 anaconda=4.0.0

# Activate the conda environment
source activate gl-env

# Ensure pip is updated to the latest version
# miniconda users may need to install pip first, using 'conda install pip'
conda update pip

# Install your licensed copy of GraphLab Create
pip install --upgrade --no-cache-dir https://get.graphlab.com/GraphLab-Create/2.1/henriquemoura@dcc.ufmg.br/DAAF-1FD8-83A6-F97D-2AF6-1C2E-1F04-D2E4/GraphLab-Create-License.tar.gz
