#
# Cookbook Name:: kuali-tools
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
package 'docker' do
  action :install
end

service 'docker' do
  action :start
end

docker_registry 'https://docker.cucloud.net/' do
  username node['dtr']['user']
  password node['dtr']['password']
  email ''
end
