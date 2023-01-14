SERVER_IP = "192.168.56.110"
SERVER_SCRIPT = <<-SHELL
  echo ">>>> START SERVER SCRIPT => for mankiS"
  export INSTALL_K3S_EXEC="--bind-address=#{SERVER_IP} --node-external-ip=#{SERVER_IP} --flannel-iface=eth1"
  export K3S_KUBECONFIG_MODE='644'
  sudo -i && apt update 2>/dev/null && apt install -y curl 2>/dev/null && curl -sfL https://get.k3s.io |  sh -
  echo "Sleeping for 5 seconds to wait for k3s to start"
  sleep 5
  cp /var/lib/rancher/k3s/server/node-token /vagrant_shared/token
  echo ">>>> END SERVER SCRIPT => for mankiS"
  SHELL
AGENT_SCRIPT = <<-SHELL
  echo ">>>> START AGENT SCRIPT => for mankiSW"
  export K3S_TOKEN_FILE=/vagrant_shared/token
  export K3S_URL=https://#{SERVER_IP}:6443
  export INSTALL_K3S_EXEC="--flannel-iface=eth1"
  sudo -i && apt update 2>/dev/null && apt install -y curl 2>/dev/null && curl -sfL https://get.k3s.io | sh -
  echo ">>>> END AGENT SCRIPT => for mankiSW"
  SHELL
AGENT_IP = "192.168.56.111"

MEMORY = "2048"
CPUS = "2"

Vagrant.configure(2) do |config|
  config.vm.box = "debian/bullseye64"
  config.vm.box_url = "https://app.vagrantup.com/debian/boxes/bullseye64/versions/11.20221219.1/providers/virtualbox.box"

  config.vm.define "mankiS" do |mankiS|
    mankiS.vm.hostname = "mankiS"
    mankiS.vm.network "private_network", ip: SERVER_IP
    mankiS.vm.synced_folder "./shared", "/vagrant_shared"
    mankiS.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--name", "mankiS"]
      vb.memory = MEMORY
      vb.cpus = CPUS
    end
    mankiS.vm.provision "shell", inline: SERVER_SCRIPT
  end

  config.vm.define "mankiSW" do |mankiSW|
    mankiSW.vm.hostname = "mankiSW"
    mankiSW.vm.network "private_network", ip: AGENT_IP
    mankiSW.vm.synced_folder "./shared", "/vagrant_shared"
    mankiSW.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--name", "mankiSW"]
      vb.memory = MEMORY
      vb.cpus = CPUS
    end
    mankiSW.vm.provision "shell", inline: AGENT_SCRIPT
  end
end
