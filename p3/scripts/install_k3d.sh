#!/usr/bin/env bash

k3d cluster create iot-p3-cluster

# Create namespaces
kubectl create namespace argocd
kubectl create namespace dev

# install ArgoCD in k3d cluster
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# access ArgoCD UI
kubectl get svc -n argocd

kubectl apply -n argocd -f application.yaml

kubectl port-forward svc/argocd-server 8080:443 -n argocd
kubectl port-forward svc/wil-playground-service 8888:8080 -n dev


echo ">> ADMIN PASSWORD:"
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode && echo
