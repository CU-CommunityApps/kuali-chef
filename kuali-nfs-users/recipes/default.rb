#
# Cookbook Name:: kuali-nfs-users
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

group 'tcadm' do
  gid '7070'
end

user 'pollinate' do
  uid '1001'
  action :manage
end

user 'tcowner' do
  comment 'tcowner account to scyn with on prem'
  uid '11448'
  gid 'tcadm'
  home '/home/tcowner'
  shell '/bin/bash'
end

user 'tomcat7' do
  comment 'tcowner account to scyn with docker'
  uid '105'
  gid 'tcadm'
  home '/home/tomcat7'
  shell '/bin/bash'
end
