#!/bin/bash


minikube kubectl -- run server --image="nginx:stable-alpine3.19-perl" --port=80 --expose=true
minikube kubectl -- wait pod server --for=jsonpath="{.status.phase}"="Running"

serviceIP=`minikube kubectl -- get service server -o jsonpath="{.spec.clusterIP}"`

minikube kubectl -- run client --image="nginx:stable-alpine3.19-perl" --rm --attach=true --restart=Never -- curl $serviceIP

minikube kubectl -- delete service server
minikube kubectl -- delete pod server
