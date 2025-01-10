#!/bin/bash


minikube kubectl -- run server -l="number=00,role=server" --image=nginx:stable-alpine3.19-perl --port=80
minikube kubectl -- wait --for=jsonpath='{.status.phase}'=Running pod/server
serverPodIP=`minikube kubectl -- get po -l="number=00,role=server" -o jsonpath="{.items[0].status.podIP}"`

minikube kubectl -- run client -l="number=00,role=client" --image=nginx:stable-alpine3.19-perl --restart=Never --attach=true -- curl $serverPodIP

minikube kubectl -- delete pods server client
