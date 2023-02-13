#
# Cookbook Name:: ced_2204
# Recipe:: apparmor
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

bash "Disable apparmor" do
  code <<-EOH
    systemctl stop apparmor.service
    update-rc.d -f apparmor remove
  EOH
end
