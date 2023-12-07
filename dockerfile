# takashi1987/myenv:0.82

#FROM pytorch/pytorch:1.9.0-cuda11.1-cudnn8-devel
# FROM pytorch/pytorch:1.12.1-cuda11.3-cudnn8-devel
FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-devel


#RUN apt-get install wget
#RUN apt-key del 7fa2af80
#RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-keyring_1.0-1_all.deb
#RUN dpkg -i cuda-keyring_1.0-1_all.deb
# RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub

RUN apt update && apt install -y --no-install-recommends

RUN apt install -y wget build-essential libssl-dev

# RUN apt-get purge cmake && \
# wget https://github.com/Kitware/CMake/releases/download/v3.21.1/cmake-3.21.1.tar.gz && \
# tar xvf cmake-3.21.1.tar.gz && \
# cd cmake-3.21.1 && \
# ./bootstrap && make && make install

RUN apt install -y git

# RUN cd ..

# RUN git clone --recursive --branch v1.4.2 https://github.com/dmlc/xgboost
# RUN mkdir -p /workspace/xgboost/build && cd /workspace/xgboost/build
# RUN echo `pwd`
# RUN cmake .. -DUSE_CUDA=ON
# RUN  make install -j4

# RUN  ls & cd xgboost/python-package && \
#     python setup.py install --use-cuda --use-nccl

RUN pip install scipy matplotlib pandas 
RUN pip install scikit-learn

RUN pip install bayesian-optimization optuna jupyterlab jupytext torchinfo

RUN apt update
# RUN apt install -y nodejs npm
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y nodejs npm

RUN npm install n -g
RUN n stable
RUN apt purge -y nodejs npm

# RUN jupyter notebook --generate-config

RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections
RUN apt install -y --no-install-recommends fontconfig ttf-mscorefonts-installer
RUN fc-cache -fv

RUN pip install flask

# added in v0.61
RUN pip install jupyterlab-git

# added in v0.62
RUN apt install htop

# added in v0.63
RUN apt install nano

# added in v0.64
RUN pip install seaborn

# added in v0.65
RUN pip install cookiecutter

# added in v0.66
RUN pip install xlrd
RUN pip install openpyxl

# added in v0.67
RUN pip install wandb

# added in v0.68
RUN pip install statsmodels
RUN pip install protobuf==3.20.1

# added in v0.69
RUN pip install ipywidgets
RUN apt install -y zip

# added in v0.80
RUN pip install networkx

# added in v0.81
#RUN pip install cuml

# RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub

# RUN apt-get update && apt-get install -y --no-install-recommends


#084
RUN apt install -y iputils-ping net-tools dnsutils
RUN pip install -U jupyterlab jupyterlab_server jupytext jupyter_core
RUN pip install jupyterlab==3.6.3

#085
RUN pip install pyriemann

#086
RUN pip install bokeh

#087
RUN pip install mlflow
RUN pip install mne

#088
RUN pip install einops