# Videos on K3s

1)
k8s tres consomateur en terme de ressources
dev par rancher lab, basé sur containerd

k3s plus leger, sans les version alpha et beta,

helm = gestionaire de package
traefik = ingress controller

```
Vagrant.configure(2) do |config|
    common = <<-SHELL
    sudo apt -y install vim tree net-tools telnet git python3
    sudo echo "autocmd filetype yaml setlocal ai ts=2 sw=2 et" > /home/vagrant/.vimrc
    sudo echo "alias python=/usr/bin/python3" >> /home/vagrant/.bashrc
    sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config
    sudo systemctl restart sshd
    SHELL
    config.vm.box = "centos/7"
    config.vm.box_url = "centos/7"

    config.vm.define "k3s" do |control|
        control.vm.hostname = "k3s"
        control.vm.network "private_network", ip: "192.168.20.110"
        control.vm.provider "virtualbox" do |v|
            v.customize [ "modifyvm", :id, "--cpus", "1" ]
            v.customize [ "modifyvm", :id, "--memory", "512" ]
            v.customize [ "modifyvm", :id, "--natdnshostresolver1", "on" ]
            v.customize [ "modifyvm", :id, "--natdnsproxy1", "on" ]
            v.customize [ "modifyvm", :id, "--name", "k3s" ]
        end
        config.vm.provision :shell, :inline => common
```
`vagrant ssh k3s` pour se connecter a la machine

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