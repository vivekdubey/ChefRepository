#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

["mysql-server", "mysql"].each do |package_name|
   package "#{package_name}" do
      action :install
   end
end

execute "boot_time_start" do
   command "chkconfig --levels 235 mysqld on"
end
service "mysqld" do
   action :start
end
