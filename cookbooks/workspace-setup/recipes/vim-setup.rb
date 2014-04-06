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
