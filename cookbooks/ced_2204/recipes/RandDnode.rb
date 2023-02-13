#
# Cookbook Name:: ced_2204
# Recipe:: RandDnode
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'ced_2204::apt_proxy'
#include_recipe 'apt::default'
include_recipe 'ced_2204::hostname'
include_recipe 'ced_2204::fsmount'

include_recipe 'ced_2204::packets'
include_recipe 'ced_2204::nagios'
include_recipe 'ced_2204::mastertree'
include_recipe 'postfix::default'
include_recipe "ced_2204::openldap"

include_recipe 'ced_2204::panasas'
include_recipe 'ced_2204::nfs_netapp'
include_recipe 'ced_2204::symlinks'
include_recipe 'ced_2204::qgis'
include_recipe 'ced_2204::TRElog'
include_recipe 'ced_2204::apparmor'
