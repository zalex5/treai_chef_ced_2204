#
# Cookbook Name:: ced_2204
# Recipe:: openldap
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


node['ced_2204']['openldappkgs'].each do |pkg, vers|
  package "#{pkg}" do
    action :install
    options '--force-yes'
  end
end

service 'nscd' do
  pattern 'nscd'
  action [:stop]
end

include_recipe 'ced_2204::mastertree'

#service 'libnss-ldap' do
#  pattern 'libnss-ldap'
#  action [:enable, :restart]
#end
