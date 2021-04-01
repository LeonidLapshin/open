#!/bin/bash -e
sudo apt-get install tcpdump -y
count=1
while [ $count -gt 0 ]
do
sudo tcpdump -v -i eth0 & 
docker pull eusacrtest.azurecr.io/rabbitmqtest
ps -ef | grep 'tcpdump' | grep -v grep | awk '{print $2}' | xargs -r kill -9 
docker image rm eusacrtest.azurecr.io/rabbitmqtest
count=$[ $count - 1 ]
done