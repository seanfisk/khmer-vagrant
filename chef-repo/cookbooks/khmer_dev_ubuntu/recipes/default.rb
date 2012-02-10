# Install requirements for developing Khmer
#
# Author:: Sean Fisk <fiskse@mail.gvsu.edu>
# Date:: 2012-02-09
# Cookbook Name:: khmer_dev_ubuntu
# Recipe:: default
#
# Copyright (C) 2012 Grand Valley State University
#

# call `apt-get update'
include_recipe 'apt'

# git - needed for downloading screed (and use with khmer)
include_recipe 'git'

# python stuff
include_recipe 'python'

# install requirements using pip
execute 'install requirements with pip' do
  user 'root'
  command "pip install -r #{node[:source_folder]}/requirements.txt"
  action :run
end

# profiling tools
include_recipe 'callgrind_python'

package 'kcachegrind' do
  action :upgrade
end
