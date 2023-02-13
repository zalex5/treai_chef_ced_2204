#
# Cookbook Name:: ced_2204
# Recipe:: hostname
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package 'host'
package 'dnsutils'


script "set_hostname" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
    NICname=$(ifconfig -a |grep BROADCAST | cut -d: -f1)
    echo $NICname >> /tmp/install
    IPADDRESS=$(ifconfig | awk '/inet / {print $2}' | grep '192')
    echo $IPADDRESS >> /tmp/install
    HOSTNAME=$(/usr/bin/nslookup $IPADDRESS | grep name| cut -d=  -f2| cut -d'.' -f1|uniq)
    hostnamectl set-hostname $HOSTNAME
  EOH
end

out_hostname = `hostname`

node.default['postfix']['main']['myhostname'] = "#{out_hostname}"
