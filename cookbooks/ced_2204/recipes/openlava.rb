#
# Cookbook Name:: ced_2204
# Recipe:: openlava
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

mountpoint = node['ced_2204']['lsf_mountpoint']
remotedir = node['ced_2204']['lsf_remotedir']
fstab_options = node['ced_2204']['lsf_fstab_options']

execute "Stop openlava" do
   command "service openlava stop"
end

directory "#{mountpoint}" do
  owner 'root'
  group 'root'
  mode '0777'
  action :create
end

ruby_block "insert_line" do
  block do
    file = Chef::Util::FileEdit.new("/etc/fstab")
    file.search_file_delete_line("#{mountpoint}")
    file.write_file
  end
only_if ("grep #{mountpoint} /etc/fstab")
end

mount "#{mountpoint}" do
device "#{remotedir}"
  fstype 'panfs'
  retries 5
  options "rw,noauto,panauto,#{fstab_options},dir-caching=0"
  action [:enable]
end

mount "#{mountpoint}" do
device "#{remotedir}"
  fstype 'panfs'
  retries 5
 options "rw,noauto,panauto,dir-caching=0"
  action [:mount]
end

service 'openlava' do
  pattern 'openlava'
  priority ({ 2 => [:start, 25], 3 => [:start, 25], 4 => [:start, 25], 5 => [:start, 25], 0 => [:stop, 20], 1 => [:stop, 20], 6 => [:stop, 20]})
  action [:enable, :restart]
end
