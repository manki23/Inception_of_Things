
https://k3d.io/
k3d is a wrapper CLI that helps you to easily create k3s clusters inside docker.
Nodes of a k3d cluster are docker containers running a k3s image.
All Nodes of a k3d cluster are part of the same docker network.

https://hub.docker.com/r/wil42/playground:v1

https://hub.docker.com/r/wil42/playground:v2

## Useful commands
```bash
kubectl get nodes
kubectl get pod -n argocd
kubectl get svc -n argocd
kubectl get svc

kubectl apply -f application.yaml
```

## Corrections commands
```bash
kubectl get ns
kubectl get pods -n dev

curl http://localhost:8888/
kubectl port-forward svc/wil-playground-service 8888:8080 -n dev
```

## Ressources
https://www.youtube.com/watch?v=MeU5_k9ssrs
https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
https://k3d.io/v5.4.6/
