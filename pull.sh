#!/bin/bash
count=1000
while [ $count -gt 0 ]
do
docker pull eusacrtest.azurecr.io/rabbitmqtest
docker image rm eusacrtest.azurecr.io/rabbitmqtest
count=$[ $count - 1 ]
done