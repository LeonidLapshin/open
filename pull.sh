#!/bin/bash
sudo apt-get install tcpdump -y
ip a
count=100
while [ $count -gt 0 ]
do
rm -rf cus.pcap
sudo tcpdump -U -v -i eth0 port 443 -w cus.pcap & 
docker pull cusacrtest.azurecr.io/rabbitmqtest || sleep 5; ps -ef | grep 'tcpdump' | grep -v grep | awk '{print $2}' | sudo xargs -r sudo kill -2; sleep 5; exit 1
docker image rm cusacrtest.azurecr.io/rabbitmqtest || sleep 5; ps -ef | grep 'tcpdump' | grep -v grep | awk '{print $2}' | sudo xargs -r sudo kill -2; sleep 5; exit 1
count=$[ $count - 1 ]
sleep 5
ps -ef | grep 'tcpdump' | grep -v grep | awk '{print $2}' | sudo xargs -r sudo kill -2
sleep 5
done
ps -ef | grep 'tcpdump' | grep -v grep | awk '{print $2}' | sudo xargs -r sudo kill -9 | exit 0