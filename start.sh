#!/bin/bash

MINIKUBE_CMD=$(which minikube) # todo: make this fail when it doesn't exit with a useful error
HELM_CMD=$(which helm) #todo: Make this fail if it's not found

if ! $($MINIKUBE_CMD status) ; then
  $MINIKUBE_CMD start
fi

$MINIKUBE_CMD addons enable ingress
$MINIKUBE_CMD addons enable ingress-dns

if ! $(helm test hello-world-chart) ; then
  $HELM_CMD install hello-world-chart hello-world-app/
fi

if ! $(helm test traefik) ; then
  $HELM_CMD install traefik traefik/traefik
fi

if ! $(grep "hello-world.local" /etc/hosts); then
  echo '127.0.0.1       hello-world.local' | sudo tee -a /etc/hosts
fi 
echo "Remember to clean up your /etc/hosts file after running this script" 

$MINIKUBE_CMD tunnel
