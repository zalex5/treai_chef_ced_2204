#
# Cookbook Name:: ced_2204
# Recipe:: trecache
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

memory = `grep MemTotal /proc/meminfo | awk '{print $2}'`

mem_thr = node['ced_2204']['memory_thr']
tre_cache_dim = node['ced_2204']['tre_cache_dim']

directory '/tre_cache' do
  owner 'root'
  group 'root'
  mode '0777'
  action :create
end

directory '/tre_cache/REMOTE_DIR' do
  owner 'root'
  group 'root'
  mode '0777'
  recursive true
  action :create
  only_if { memory.to_i < mem_thr.to_i }
 end

bash "insert the ram disk creation in openlava start script" do
  code <<-EOH
    cp -f /lsf/etc/openlava.starsXP /etc/init.d/openlava
    service openlava restart
  EOH
  only_if { memory.to_i > mem_thr.to_i }
end
