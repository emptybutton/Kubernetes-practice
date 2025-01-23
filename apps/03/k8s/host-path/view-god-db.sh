#!/bin/bash

eval `minikube docker-env -u`

minikube kubectl -- create -f pods/god-pod.yaml
minikube kubectl -- wait pod god --for=jsonpath={status.phase}=Running

echo "Wait for work..."
sleep 3

echo "DB:"
docker exec minikube cat /tmp/k8s-practice/03/db/file.txt

minikube kubectl -- delete pod god
docker exec minikube rm /tmp/k8s-practice/03/ -fr
eval `minikube docker-env`
