# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "centos" do |node|
    # VMの設定
    node.vm.box = "centos/7"
    node.vm.hostname = "vagrant"

    # ネットワーク設定
    node.vm.network :private_network, ip: "192.168.100.10"

    node.vm.provision "shell", inline: <<-SHELL
      yum install -y yum-utils
      yum-config-manager --disable *
      yum-config-manager --add-repo http://yumrepo.sysadfun.com/centos/7/updates/x86_64/
      yum-config-manager --add-repo http://yumrepo.sysadfun.com/centos/7/os/x86_64/

      curl -L https://omnitruck.chef.io/install.sh | bash
      yum install -y git

      useradd -m groupXX
    SHELL
  end
end
