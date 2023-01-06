Vagrant.configure("2") do |config|
  config.vm.box = "generic/debian11"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.provision "shell", inline: <<-SHELL
  curl -sSL https://get.k3s.io | sh
  sudo cp /etc/rancher/k3s/k3s.yaml /vagrant/kubeconfig
  sed -i "s/127\.0\.0\.1/192.168.33.10/" /vagrant/kubeconfig
  SHELL
end
