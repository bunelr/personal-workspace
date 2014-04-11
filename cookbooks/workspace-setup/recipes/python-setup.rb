#
# Cookbook Name:: workspace-setup
# Recipe:: python-setup
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

directory "/opt/virtual-env/" do
  owner "vagrant"
  group "vagrant"
  mode 0755
  action :create
end


python_virtualenv "/opt/virtual-env/python33/" do
  owner "vagrant"
  group "vagrant"
  options "--upgrade" 
  action :create
end
