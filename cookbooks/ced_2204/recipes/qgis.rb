#
# Cookbook Name:: ced_2204
# Recipe:: qgis
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


package "qgis" do
#  version "1:2.14.3+20trusty"
  action :install
  options '--force-yes'
end
