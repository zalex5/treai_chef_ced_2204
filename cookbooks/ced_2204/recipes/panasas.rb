#
# Cookbook Name:: ced_2204
# Recipe:: panasas
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package 'panfs' do
  action :install
  options '--force-yes'
end

package 'ntp'

bash "Configure panfs if not already configured" do
  code <<-EOH
    /usr/local/sbin/config_panfs -a -r 192.168.4.190 -o rmlist="(192.168.4.190;192.168.4.192;192.168.4.193)",dir-caching=0
  EOH
  not_if ("grep panfs /etc/fstab")
end

bash "Ubuntu panfs script: set /bin/bash instead of /bin/sh" do
  code <<-EOH
    systemctl enable panfs
  EOH
end

service 'panfs' do
  pattern 'panfs'
  action [:enable, :start]
end

node['ced_2204']['panfs_mounts'].each do |mountpoint,src|
  directory "#{mountpoint}" do
    owner 'root'
    group 'root'
    mode '0777'
    action :create
  end

  ruby_block "insert_line" do
    block do
      file = Chef::Util::FileEdit.new("/etc/fstab")
      file.search_file_delete_line("/#{mountpoint}")
      file.write_file
    end
  only_if ("grep /#{mountpoint} /etc/fstab")
  end

  mount "/#{mountpoint}" do
    device "#{src[0]}"
    fstype 'panfs'
    options "rw,noauto,panauto,#{src[1]},dir-caching=0"
    action [:enable]
  end

  mount "/#{mountpoint}" do
    device "#{src[0]}"
    fstype 'panfs'
    options "rw,noauto,panauto,dir-caching=0"
    action [:mount]
  end

end
