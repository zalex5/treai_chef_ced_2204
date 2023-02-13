#
# Cookbook Name:: ced_2204
# Recipe:: nfs_netapp
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

netapp_rootmount = node['ced_2204']['netapp3_rootdir']

directory "#{netapp_rootmount}" do
  owner 'root'
  group 'root'
  mode '0777'
  action :create
end

node['ced_2204']['netapp3_mounts'].each do |mount_vol,src|

  directory "#{mount_vol}" do
    owner 'root'
    group 'root'
    mode '0777'
    action :create
  end

  ruby_block "insert_line" do
    block do
      file = Chef::Util::FileEdit.new("/etc/fstab")
      file.search_file_delete_line("#{mount_vol}")
      file.write_file
    end
  only_if ("grep #{mount_vol} /etc/fstab")
  end

  mount "#{mount_vol}" do
    device "#{src[0]}"
    fstype 'nfs'
    options "#{src[1]}"
    action [:enable]
  end

  mount "/#{mount_vol}" do
    device "#{src[0]}"
    fstype 'nfs'
    options "#{src[1]}"
    action [:mount]
  end

end
