#!/bin/bash
sudo apt-get install tcpdump -y
ip a
count=100

while [ $count -gt 0 ]
do
    rm -rf cus.pcap
    sudo tcpdump -U -v -i eth0 port 443 -w cus.pcap & 

    pull_out=$(docker pull cusacrtest.azurecr.io/rabbitmqtest)
    echo "==="
    echo $pull_out
    echo "==="
    if [[ $pull_out != "*Downloaded newer image*" ]]; then
        sleep 5
        ps -ef | grep 'tcpdump' | grep -v grep | awk '{print $2}' | sudo xargs -r sudo kill -2
        sleep 5
        exit 0
    fi

    docker image rm cusacrtest.azurecr.io/rabbitmqtest 
    count=$[ $count - 1 ]

    sleep 5
    ps -ef | grep 'tcpdump' | grep -v grep | awk '{print $2}' | sudo xargs -r sudo kill -2
    sleep 5
done
ps -ef | grep 'tcpdump' | grep -v grep | awk '{print $2}' | sudo xargs -r sudo kill -9 | exit 0