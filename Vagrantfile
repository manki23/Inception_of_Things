SCRIPT_SHELL = "<<-SHELL
sudo apt update && sudo apt upgrade && sudo apt-get install curl && curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.19.5+k3s1 K3S_KUBECONFIG_MODE='644' sh -
SHELL"
MEMORY = "1024"
CPUS = 1

Vagrant.configure(2) do |config|
  config.vm.box = "debian/bullseye64"
  config.vm.box_url = "https://app.vagrantup.com/debian/boxes/bullseye64/versions/11.20221219.1/providers/virtualbox.box"


  config.vm.define "mankiS" do |mankiS|
    mankiS.vm.hostname = "mankiS"
    mankiS.vm.network "private_network", ip: "192.168.56.110"
    mankiS.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--name", "mankiS"]
      vb.memory = MEMORY
      vb.cpus = CPUS
    end
    config.vm.provision "shell", inline: <<-SHELL
    sudo apt update -y && sudo apt upgrade -y && sudo apt-get install curl -y && curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.19.5+k3s1 K3S_KUBECONFIG_MODE='644' sh -
    SHELL
    # control.vm.provision "shell", path: REDACTED
  end


  config.vm.define "mankiSW" do |mankiSW|
    mankiSW.vm.hostname = "mankiSW"
    mankiSW.vm.network "private_network", ip: "192.168.56.111"
    mankiSW.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--name", "mankiSW"]
      vb.memory = MEMORY
      vb.cpus = CPUS
    end
    config.vm.provision "shell", inline: <<-SHELL
    sudo apt update -y && sudo apt upgrade -y && sudo apt-get install curl -y && curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.19.5+k3s1 K3S_KUBECONFIG_MODE='644' sh -
    SHELL
    # control.vm.provision "shell", path: REDACTED
  end
end