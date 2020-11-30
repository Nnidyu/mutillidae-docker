#!/bin/bash

sudo systemctl start docker
sudo docker-compose -f mutillidae.yml up
