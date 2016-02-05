#
# Cookbook Name:: kuali-tools
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

docker_image 'docker.cucloud.net/stash' do
  tag 'latest'
  action :pull
  notifies :redeploy, 'docker_container[stash]', :immediately
end

docker_container 'stash' do
  repo 'docker.cucloud.net/stash'
  tag 'latest'
  port '7990:7990'
  volumes [ '/stash:/atlassian/data/stash' ]
  restart_policy 'always'
  log_driver 'syslog'
  action :run_if_missing
end
