#
# Cookbook Name:: workspace-setup
# Recipe:: git-setup
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#


package "git" do
  action :install
end

cookbook_file "/home/vagrant/.gitconfig" do
  source ".gitconfig"
  mode 0644
end
