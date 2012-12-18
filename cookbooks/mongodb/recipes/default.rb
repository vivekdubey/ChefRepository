#cookbook_file "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6" do
 # source "RPM-GPG-KEY-EPEL-6"
  #owner "root"
  #group "root"
  #action :create
  #not_if { File.exists? ("/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6") }
#end


#%w{ epel rbel6 }.each do |repo|
template "/etc/yum.repos.d/10gen.repo" do
    source "10gen.repo.erb"
    action :create
end
#end
#include_recipe "basic_install::git_install"
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

