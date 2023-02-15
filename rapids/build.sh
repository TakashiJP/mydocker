#!/bin/sh

sudo docker build --build-arg http_proxy=http://proxy.rdh.ecl.ntt.co.jp:20066 --build-arg https_proxy=http://proxy.rdh.ecl.ntt.co.jp:20066 . -t takashi5515/takashi_cuml:0.1
