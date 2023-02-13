#
# Cookbook Name:: ced_2204
# Recipe:: TRElog
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

directory '/var/log/TRE' do
  owner 'swgroup'
  group 'TRE'
  mode '0775'
  ignore_failure true
  action :create
end
