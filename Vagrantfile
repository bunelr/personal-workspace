# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

require 'etc'
current_user = Etc.getlogin

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.hostname = "devbox-#{current_user}"

  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder "../workspace", "/workspace"

  config.vm.provider "virtualbox" do |vb|

     vb.gui = false 
     vb.customize ["modifyvm", :id, "--memory", "2048"]

  end
  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|

    chef.run_list = [
      "recipe[apt::default]"
    ]

  end

end
