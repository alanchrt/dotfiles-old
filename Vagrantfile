# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "boxcutter/ubuntu1604-desktop"
  config.vm.provision :shell, :path => "demo/provision.sh"
  config.ssh.forward_agent = true

end
