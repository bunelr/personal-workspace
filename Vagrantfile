# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"

require 'etc'
current_user = Etc.getlogin

Vagrant.require_plugin "vagrant-berkshelf"
Vagrant.require_plugin "vagrant-omnibus"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  # Uncomment if you don't have a box on your local machine
  # config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.box_url = "file:///C:/precise64.box"

  config.vm.hostname = "devbox-#{current_user}"

  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder "../workspace", "/workspace"

  config.vm.provider "virtualbox" do |vb|

     vb.gui = false 
     vb.customize ["modifyvm", :id, "--memory", "2048"]

  end
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|

    chef.run_list = [
      "recipe[apt::default]",
      "recipe[workspace-setup::git-setup]",
      "recipe[workspace-setup::vim-setup]",
      "recipe[python::source]",
      "recipe[workspace-setup::python-setup]"
    ]

    chef.json = {
      "python" => {
        "version" => "3.4.0",
        "prefix_dir" => "/opt/python3/",
	"binary" => "/opt/python3/bin/python3",
	"pip_location" => "/opt/python3/bin/pip3",
        "virtualenv_location" => "/opt/python3/bin/pyvenv-3.4",
        "install_method" => "source"
        }
      }	
  end

end
