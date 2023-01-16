# Videos on K3s

1)
k8s tres consomateur en terme de ressources
dev par rancher lab, basé sur containerd

k3s plus leger, sans les version alpha et beta,

helm = gestionaire de package
traefik = ingress controller


Puis installation des packets:
```
apt install -y container-selinux-policy-base
rpm -i https://rpm.rancher.io/k3s-selinux-0-1.1-rc1.el7.noarch.rpm
```
Install k3s:
```
curl -sfL https://get.k3s.io | sh -
```

vim /etc/systemd/system/k3s.service
ajouter `--flannel-iface 'eth1'` en dessous de `server \`

Apres avoir modifie un service, lancer `systemctl daemon-reload`
et `systemctl restart k3s`

installer kubectl pour se connecter au cluster


2)
kubectl get nodes -o wide


`vagrant global-status`
`vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']`

Un Ingress est un objet Kubernetes qui gère l'accès externe aux services dans un cluster, généralement du trafic HTTP.