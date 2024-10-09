#!/bin/bash
sudo su
yum update -y
yum install npm -y
yum install node -y
yum install git -y
yum install docker -y
systemctl start docker
systemctl status docker
git clone https://github.com/CyuanT/simple-node-app.git
cd ~/simple-node-app
docker build -t simple-node-app .
docker run -dp 8080:8080 simple-node-app