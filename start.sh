#!/bin/bash

MINIKUBE_CMD=$(which minikube) # todo: make this fail when it doesn't exit with a useful error

# todo: If minikube status does not equal 0 - start er up 
$MINIKUBE_CMD start
$MINIKUBE_CMD addons enable ingress
$MINIKUBE_CMD addons enable ingress-dns

# todo: check to see if hello-world.local is already an entry 
#echo '127.0.0.1       hello-world.local' | sudo tee -a /etc/hosts
