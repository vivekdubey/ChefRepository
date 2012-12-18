template "/etc/yum.repos.d/10gen.repo" do
    source "10gen.repo.erb"
    action :create
end
%w{mongo-10gen mongo-10gen-server}.each do |package|
    package "#{package}" do
       action :install
    end
end
service "mongod" do
    action :start
end

execute "start_at_boot" do
    command "chkconfig mongod on"
    notifies :restart,"service[mongod]" 
end

