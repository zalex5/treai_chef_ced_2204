#
# Cookbook Name:: ced_2204
# Recipe:: rabbit
#
# Copyright  (c) 2016 The Authors, All Rights Reserved.


package "rabbitmq-server" do
  version "3.2.4-1"
  action :install
  options '--force-yes'
end

directory '/var/lib/rabbitmq/' do
  owner 'rabbitmq'
  group 'rabbitmq'
  action :create
end

file '/var/lib/rabbitmq/.erlang.cookie' do
  mode '0400'
  owner 'rabbitmq'
  group 'rabbitmq'
end

service 'rabbitmq-server' do
  pattern 'rabbitmq-server'
  action [:enable, :start]
end
