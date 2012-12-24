#
# Cookbook Name:: java
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
script "install_jdk_rpm" do
   interpreter "bash"
   user "root"
   cwd "/opt/install"
   code <<-EOH
      wget http://10.12.7.16/jdk-7u10-linux-x64.rpm
      yum localinstall -y jdk-7u10-linux-x64.rpm
   EOH
   not_if {File.exists?('/usr/bin/java')}
end
