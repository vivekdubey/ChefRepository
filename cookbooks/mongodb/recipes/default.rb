#cookbook_file "/var/chef/authentication.js" do
 #   source "authentication.js"
  #  action :create
#end
admins = data_bag('admins')
admin  = data_bag_item('admins','root')
template "/var/chef/authentication.js" do
    source "authentication.js.erb"
    action :create
    variables({
    :password => admin['password']
    })
end
template "/etc/yum.repos.d/10gen.repo" do
    source "10gen.repo.erb"
    action :create
end
%w{mongo-10gen mongo-10gen-server}.each do |package|
    package "#{package}" do
       action :install
    end
end
script "setup_root_user" do
    interpreter "bash"
    user "root"
    code <<-EOH
        mongo admin /var/chef/authentication.js
        service mongod restart --auth
    EOH
end
service "mongod" do
    action :start
    not_if { File.exists?('/usr/bin/mongod') }
end

execute "start_at_boot" do
    command "chkconfig mongod on"
    notifies :restart,"service[mongod]" 
   not_if { File.exists?('/usr/bin/mongod') } 
end

