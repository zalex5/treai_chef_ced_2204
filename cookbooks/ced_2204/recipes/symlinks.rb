#
# Cookbook Name:: ced_2204
# Recipe:: symlinks
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#link '/usr/lib/libjpeg.so' do
#  to '/usr/lib/x86_64-linux-gnu/libjpeg.so'
#end

#link '/usr/lib/libfreetype.so' do
#  to '/usr/lib/x86_64-linux-gnu/libfreetype.so'
#end

#link '/usr/lib/libz.so' do
#  to '/usr/lib/x86_64-linux-gnu/libz.so'
#end

#link '/usr/include/freetype' do
#  to '/usr/include/freetype2'
#end

directory "/bigbang" do
  owner 'root'
  group 'root'
  mode '0777'
  action :create
end

directory "/tre_cache" do
  owner 'root'
  group 'root'
  mode '0777'
  action :create
end
