# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "box-cutter/ubuntu1404-desktop"

  config.vm.provider "virtualbox" do |v|
    v.gui = true
  end
  
  # Install stuff needed for running samples
  config.vm.provision "shell", inline: <<-SHELL
     sudo apt-get update
     sudo apt-get install -y python-demjson jq python-protobuf protobuf-compiler build-essential ruby-dev openjdk-7-jdk
     sudo gem install cbor cbor-diag cddl msgpack --no-ri --no-rdoc
     wget https://github.com/PJK/libcbor/releases/download/v0.4.0/libcbor-0.4.0-Linux.deb
     sudo dpkg -i libcbor-0.4.0-Linux.deb
  SHELL
end
