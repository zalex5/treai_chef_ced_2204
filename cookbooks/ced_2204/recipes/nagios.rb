#
# Cookbook Name:: ced_2204
# Recipe:: nagios
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package'nagios-nrpe-server'
package'nagios-plugins'
package'nagios-plugins-basic'
package'nagios-plugins-standard'


service 'nagios-nrpe-server' do
  pattern 'nagios-nrpe-server'
  action [:enable, :restart]
end
