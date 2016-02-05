#
# Cookbook Name:: kuali-exports
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

nfs_export "/exports" do
  network '10.0.0.0/8'
  writeable true
  sync false
  options ['fsid=0,insecure,no_subtree_check,async']
end

environments = ['dev', 'ci', 'intdev', 'sb', 'emerg', 'test', 'devops', 'train', 'sanity']

environments.each do |env|
  nfs_export "/exports/#{env}" do
    network '10.0.0.0/8'
    writeable true
    sync false
    options ['nohide,insecure,no_subtree_check']
  end
end
