#!/bin/sh

sudo docker build . -t takashi5515/takashi_env:0.81
#sudo docker build --build-arg http_proxy=http://proxy.rdh.ecl.ntt.co.jp:20066 --build-arg https_proxy=http://proxy.rdh.ecl.ntt.co.jp:20066 . -t takashi5515/takashi_env:0.81
