
## Commandes to check if everything is running:
```
systemctl status k3s-agent
kubectl get nodes -o wide
systemctl status k3s
ip address
```
---
`vagrant global-status`   
`vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']`

Un Ingress est un objet Kubernetes qui gère l'accès externe aux services dans un cluster, généralement du trafic HTTP.


```bash
ip a
sudo passwd osboxes # mdp:manki

root@debian:/home/manki/iot# su -
root@debian:~# usermod -aG sudo manki
root@debian:~# 

usermod -aG sudo manki
```

setup virtual box vm with ssh:
https://code-maven.com/virtualbox-host-only-network-ssh-to-remote-machine

mli tuto
https://mli42.notion.site/mli42/How-to-SSH-to-a-VM-at-42-376fa1f7e9cf4ed786526cdd2c062e25

install vagrant 
https://developer.hashicorp.com/vagrant/downloads

Resources:
https://developer.hashicorp.com/vagrant/docs/vagrantfile/tips
https://wiki.alpinelinux.org/wiki/Setting_up_a_SSH_server
https://kubernetes.io/docs/reference/kubectl/cheatsheet/

Installer :
git
vs code
vim
vagrant
virtual box 7
curl


```
qemu-img create -f qcow2 iot.qcow2 20G && \
qemu-system-x86_64 -cdrom debian-11.6.0-amd64-netinst.iso \
         -hda iot.qcow2 \
         -enable-kvm \
         -machine q35 \
         -cpu host \
         -m 12G \
         -smp $(nproc) \
         -net user,hostfwd=tcp::5000-:22,hostfwd=tcp::8080-:80 \
         -net nic &
```

sudo apt install git-all

sudo apt-get install vim

Interesting resources:
- 

Very useful resources:
- https://docs.k3s.io/quick-start
- https://akos.ma/blog/vagrant-k3s-and-virtualbox/
