log_level                :info
log_location             STDOUT
node_name                'admin'
client_key               '#{ENV['HOME']}/.chef/admin.pem'
validation_client_name   'chef-validator'
validation_key           '#{ENV['HOME']}/.chef/validation.pem'
chef_server_url          'https://chef.edify.cr/'
syntax_check_cache_path  '#{ENV['HOME']}/.chef/syntax_check_cache'

knife[:aws_access_key_id]     = ENV['AWS_ACCESS_KEY_ID']
knife[:aws_secret_access_key] = ENV['AWS_SECRET_ACCESS_KEY']
