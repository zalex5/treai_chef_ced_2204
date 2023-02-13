node['ced_2204']['host_entry'].each do |host_ip, host_name|
    hostsfile_entry "#{host_ip}" do
        hostname "#{host_name}"
        action :create
    end
end
