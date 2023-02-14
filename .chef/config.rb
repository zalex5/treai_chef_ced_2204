current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                'admin'
client_key               "admin.pem"
validation_client_name   'tremira-validator'
validation_key           "tremira-validator.pem"
chef_server_url          'https://treai-chef/organizations/tremira'
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
