Vagrant.configure(2) do |config|
  config.vm.box = "generic/debian11"
  # config.vm.box_url = REDACTED

  config.vm.define "mankiS" do |mankiS|
    mankiS.vm.hostname = "mankiS"
    mankiS.vm.network "private_network", ip: "192.168.56.110"
    mankiS.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--name", "mankiS"]
      vb.memory = "1024"
      vb.cpu = 1
  end
  config.vm.provision "shell", inline: <<-SHELL
    curl -sSL https://get.k3s.io | sh
    sudo cp /etc/rancher/k3s/k3s.yaml /vagrant/kubeconfig
    sed -i "s/127\.0\.0\.1/192.168.56.110/" /vagrant/kubeconfig
  SHELL
    # control.vm.provision "shell", path: REDACTED
  end


  config.vm.define "mankiSW" do |mankiSW|
    mankiSW.vm.hostname = "mankiSW"
    mankiSW.vm.network "private_network", ip: "192.168.56.111"
    mankiSW.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--name", "mankiSW"]
      vb.memory = "1024"
      vb.cpu = 1
    end
    config.vm.provision "shell", inline: <<-SHELL
      curl -sSL https://get.k3s.io | sh
      sudo cp /etc/rancher/k3s/k3s.yaml /vagrant/kubeconfig
      sed -i "s/127\.0\.0\.1/192.168.56.111/" /vagrant/kubeconfig
    SHELL
    # control.vm.provision "shell", path: REDACTED
  end
end