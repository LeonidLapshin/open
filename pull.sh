#!/bin/bash -e
sudo apt-get install tcpdump -y
echo "==="
ip a
echo "==="
sudo tcpdump -v -i eth0 port 443 -w cus.pcap & 
count=100
while [ $count -gt 0 ]
do
docker pull cusacrtest.azurecr.io/rabbitmqtest
docker image rm cusacrtest.azurecr.io/rabbitmqtest
count=$[ $count - 1 ]
done
ps -ef | grep 'tcpdump' | grep -v grep | awk '{print $2}' | xargs -r kill -9 | exit 0