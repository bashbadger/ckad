#!/usr/bin/env bash

# Quick script to install/enable NGINX ingress controller via helm.
# Run this after creating the ingress with ingress.yaml.
# Then test access to the ingress.
# Requires: helm

install() {
  helm repo add nginx-stable https://helm.nginx.com/stable
  helm repo update
  kubectl create namespace nginx-ingress
  helm install nginx-ingress nginx-stable/nginx-ingress -n nginx-ingress
  echo && sleep 10
}

# Do not attempt to re-install ingress if it's already installed.
helm status nginx-ingress -n nginx-ingress || install
echo
kubectl get svc nginx-ingress-nginx-ingress -n nginx-ingress
echo

cat <<INFO
Edit hosts file with cluster IP shown:
  <IP> test.ingress.com
Then test access:
  curl test.ingress.com
INFO
