#!/bin/bash

minikube kubectl -- run nginx -l="number=01,role=nginx" --image="nginx:stable-alpine3.19-perl"
minikube kubectl -- expose pod nginx --type="NodePort" --name=server --port=80 --target-port=80

minikube kubectl -- wait --for=jsonpath='{.status.phase}'=Running pod/nginx

curl `minikube service server --url`

minikube kubectl -- delete service server
minikube kubectl -- delete pod nginx
