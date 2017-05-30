server '13.113.15.22', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/home/vagrant/.ssh/id_rsa'
