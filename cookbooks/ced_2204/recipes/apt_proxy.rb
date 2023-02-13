ip = node['ced_2204']['aptproxy_ip']

ruby_block "Add local repo to sources.list" do
  block do
    file = Chef::Util::FileEdit.new("/etc/apt/sources.list")
    file.insert_line_if_no_match("#{ip}" , "deb http://#{ip}/amd64/ ./")
    file.write_file
  end
end

script "install_localrepo_gpg_key" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
    wget http://#{ip}/amd64/public.key
    apt-key add ./public.key
    rm ./public.key
    EOH
end

# Disable unattended updates

file '/etc/apt/apt.conf.d/50unattended-upgrades' do
	action :delete
end

execute "apt-get-update" do
  command 'apt-get update'
  ignore_failure true
end
