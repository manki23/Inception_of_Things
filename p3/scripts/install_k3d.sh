#!/usr/bin/env bash

k3d cluster create iot-p3-cluster -p "8888:80@loadbalancer"

kubectl wait deployment/metrics-server -n kube-system --for=condition=Available 2>/dev/null

# Create namespaces
kubectl create namespace argocd
kubectl create namespace dev

# install ArgoCD in k3d cluster
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl apply -n argocd -f ../confs/application.yaml
kubectl apply -n dev -f ../confs/ingress.yaml

kubectl wait deployment/argocd-server -n argocd --for=condition=Available
kubectl port-forward svc/argocd-server 8080:443 -n argocd &


echo ">> ADMIN PASSWORD:"
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode && echo
