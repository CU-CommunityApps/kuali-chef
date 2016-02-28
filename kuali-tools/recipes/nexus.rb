#
# Cookbook Name:: kuali-tools
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

docker_image 'dtr.cucloud.net/cs/nexus' do
  tag 'latest'
  action :pull
  notifies :redeploy, 'docker_container[nexus]', :immediately
end

docker_container 'nexus' do
  repo 'dtr.cucloud.net/cs/nexus'
  tag 'latest'
  port '8081:8081'
  volumes [ '/nexus:/nexus' ]
  restart_policy 'always'
  log_driver 'syslog'
  action :run_if_missing
end
