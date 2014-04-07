#
# Cookbook Name:: workspace-setup
# Recipe:: vim-setup
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#


package "vim" do
  action :install
end

cookbook_file "/home/vagrant/.vimrc" do
  source ".vimrc"
  mode 0644
end

directory "/home/vagrant/.vim/bundle/" do
  recursive true
  action :create
  mode 0777
end

git "Vundle" do
  repository 'https://github.com/gmarik/vundle.git'
  reference 'master'
  action :checkout
  destination '/home/vagrant/.vim/bundle/vundle'
end

execute "Install Vim plugin with Vundle" do
  user "vagrant"
  group "vagrant"
  environment 'HOME' => "/home/vagrant/"
  command "vim -c 'set shortmess=at' +PluginInstall +qall"
end
