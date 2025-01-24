#!/bin/bash

eval `minikube docker-env -u`

docker exec minikube mkdir /tmp/k8s-practice /tmp/k8s-practice/03 /tmp/k8s-practice/03/db1 /tmp/k8s-practice/03/db2 -p

eval `minikube docker-env`
