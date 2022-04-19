#!/bin/sh

# set the docker image tag
sudo docker run -p 9000:8888 --gpus all -v `pwd`:/workspace/  takashi5515/takashi_env:0.66 jupyter lab --ip=0.0.0.0 --allow-root --NotebookApp.token=''
