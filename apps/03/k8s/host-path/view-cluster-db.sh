#!/bin/bash


eval `minikube docker-env -u`

minikube kubectl -- create -f pods/cluster/worker-pod.yaml
minikube kubectl -- create -f pods/cluster/viewer-pod.yaml

minikube kubectl -- wait pod worker --for=jsonpath={status.phase}=Running
minikube kubectl -- wait pod viewer --for=jsonpath={status.phase}=Running

echo "Wait for work..."
sleep 3

echo "DB:"
docker exec minikube cat /tmp/k8s-practice/03/db/file.txt

minikube kubectl -- delete pods worker viewer
docker exec minikube rm /tmp/k8s-practice/03/ -fr

eval `minikube docker-env`
