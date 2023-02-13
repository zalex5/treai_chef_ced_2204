#
# Cookbook Name:: ced_2204
# Recipe:: update_node
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'ced_2204::apt_proxy'
#include_recipe 'apt::default'
include_recipe 'ced_2204::fsmount'
include_recipe 'ced_2204::packets'
include_recipe 'ced_2204::mastertree'
include_recipe 'ced_2204::nagios'
include_recipe 'ced_2204::symlinks'
include_recipe 'ced_2204::trecache'
include_recipe 'ced_2204::apparmor'

file '/etc/motd' do
	content 'TRE-ALTAMIRA CLUSTER NODE'
end
