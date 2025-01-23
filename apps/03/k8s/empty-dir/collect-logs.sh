#!/bin/bash


minikube kubectl -- create -f god-pod.yaml
minikube kubectl -- wait pod god --for=jsonpath={status.phase}=Running

echo "Wait for logs..."
sleep 3

echo "Logs:"
minikube kubectl -- logs god -c viewer

minikube kubectl -- delete pod god
