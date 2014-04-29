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

python_virtualenv "/opt/virtual-env/python34/" do
  owner "vagrant"
  group "vagrant"
  options "--upgrade" 
  action :create
end

execute "Ensure pip is installed for the venv" do
  command "/opt/virtual-env/python34/bin/python3 -m ensurepip --upgrade"
  action :run
end

python_pip "pyramid" do
  virtualenv "/opt/virtual-env/python34/"
  action :install
end
