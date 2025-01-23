#!/bin/bash


eval `minikube docker-env -u`

minikube kubectl -- create -f pods/cluster/worker-pod.yaml --save-config=true
minikube kubectl -- wait pod worker --for=jsonpath={status.phase}=Running

minikube kubectl -- apply -R -f pods/cluster
minikube kubectl -- wait pod worker --for=jsonpath={status.phase}=Running
minikube kubectl -- wait pod viewer --for=jsonpath={status.phase}=Running

echo "Wait for work..."
sleep 3

echo "DB:"
docker exec minikube cat /tmp/k8s-practice/03/db/file.txt

minikube kubectl -- delete -R -f pods/cluster
docker exec minikube rm /tmp/k8s-practice/03/db -fr

eval `minikube docker-env`
