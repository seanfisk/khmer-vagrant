# Install callgrind-python
#
# Author:: Sean Fisk <fiskse@mail.gvsu.edu>
# Date:: 2012-02-09
# Cookbook Name:: callgrind_python
# Recipe:: default
#
# Copyright (C) 2012 Grand Valley State University
#

# dependent on python being installed
include_recipe 'python'

# download deb package
remote_file 'download callgrind-python deb' do
  source "#{node['callgrind_python']['package_url_prefix']}/#{node['callgrind_python']['package_file_name']}"
  path "#{node['callgrind_python']['package_path_prefix']}/#{node['callgrind_python']['package_file_name']}"
  mode '0644'
  owner 'root'
  checksum 'ff06db3e591cc8712787ac04a47b1266fb876b9ec8635363dec0691efb765439'
  action :create
end

# use gdebi to install valgrind deb package
## install gdebi-core
package 'gdebi-core' do
  action :upgrade
end

## install using gdebi
execute 'install callgrind-python deb' do
  user 'root'
  command "gdebi '#{node['callgrind_python']['package_path_prefix']}/#{node['callgrind_python']['package_file_name']}'"
  action :run
end

