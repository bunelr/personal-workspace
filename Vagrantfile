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
      "recipe[workspace-setup::python-setup]",
      "recipe[ruby_build]",
      "recipe[rbenv::system]",
      "recipe[rbenv::vagrant]",
      "recipe[rbenv::user]",
      "recipe[postgresql::server]",
      "recipe[nodejs]"
    ]

    chef.json = {
      "python" => {
        "version" => "3.4.0",
        "prefix_dir" => "/opt/python3/",
	"binary" => "/opt/python3/bin/python3",
	"pip_location" => "/opt/python3/bin/pip3",
        "virtualenv_location" => "/opt/python3/bin/pyvenv-3.4",
        "install_method" => "source"
        },
      "rbenv" => {
        "global" => "2.0.0-p247",
        "rubies" => ["2.0.0-p247"],
        "gems" => {
          "2.0.0-p247" => [
            { "name" => "bundler"}
          ]
        },
        "user_installs" => [{
	  "user"    => "vagrant",
	  "rubies"  => ["2.0.0-p247"],
	  "global"  => "2.0.0-p247",
	  "gems"    => {
	    "2.0.0-p247" => [
	      {"name" => "bundler"}
	      ]
            }
         }]
      },
      "postgresql" => {
        "version" => "9.3",
        "password" => {
          "postgres" => "postgrespwd"
        },
        "config" => {
          "ssl_key_file" => "/etc/ssl/private/ssl-cert-snakeoil.key",
          "ssl_cert_file" => "/etc/ssl/certs/ssl-cert-snakeoil.pem"
        }
      }
    }	
  end
end
