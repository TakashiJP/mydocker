# takashi1987/myenv:0.64

FROM pytorch/pytorch:1.9.0-cuda11.1-cudnn8-devel

RUN apt-get update && apt-get install -y --no-install-recommends

RUN apt-get install -y wget build-essential libssl-dev

RUN apt-get purge cmake && \
wget https://github.com/Kitware/CMake/releases/download/v3.21.1/cmake-3.21.1.tar.gz && \
tar xvf cmake-3.21.1.tar.gz && \
cd cmake-3.21.1 && \
./bootstrap && make && make install

RUN apt-get install -y git

RUN cd ..

RUN git clone --recursive --branch v1.4.2 https://github.com/dmlc/xgboost && \
    mkdir -p xgboost/build && cd xgboost/build && \
    cmake .. -DUSE_CUDA=ON && \
    make install -j4

RUN  ls & cd xgboost/python-package && \
    python setup.py install --use-cuda --use-nccl

RUN conda install scipy matplotlib pandas scikit-learn

RUN pip install bayesian-optimization optuna jupyterlab jupytext torchinfo

RUN apt-get update
RUN apt-get install -y nodejs npm
RUN npm install n -g
RUN n stable
RUN apt-get purge -y nodejs npm

RUN jupyter notebook --generate-config

RUN echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections
RUN apt-get install -y --no-install-recommends fontconfig ttf-mscorefonts-installer
RUN fc-cache -fv

RUN pip install flask

# added in v0.61
RUN pip install jupyterlab-git

# added in v0.62
RUN apt-get install htop

# added in v0.63
RUN apt-get install nano

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