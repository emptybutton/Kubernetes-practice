#!/bin/ash


minikube kubectl -- apply -R -f objects
minikube kubectl -- wait pods viewer1 viewer2 --for=jsonpath={status.phase}=Running

echo "viewer1 logs:"
minikube kubectl -- logs viewer1

echo "viewer2 logs:"
minikube kubectl -- logs viewer2

minikube kubectl -- delete -R -f objects
