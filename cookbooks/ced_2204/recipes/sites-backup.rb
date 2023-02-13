#
# Cookbook Name:: ced_2204
# Recipe:: sites-backup
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

server = node['ced_2204']['sites_backup_address']
remotedir = node['ced_2204']['sites_backup_remotedir']
mountpoint = node['ced_2204']['sites_backup_mountpoint']

device = "#{server}" + ":" + "#{remotedir}"

directory "#{mountpoint }" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

bash "remove the mounted dir from fstab if it already exists" do
  code <<-EOH
    umount #{mountpoint} || /bin/true
    sed -i '/\\#{mountpoint}/d' /etc/fstab
  EOH
end
mount "#{mountpoint}" do
  device "#{device}"
  fstype 'nfs'
  options 'rw'
  action [:mount, :enable]
end
