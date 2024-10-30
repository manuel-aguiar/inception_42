#! /bin/bash

sudo docker stop test
yes | sudo docker rm test
yes | sudo docker rmi test