#
# Cookbook Name:: java
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "oracle-java7-jdk" do
  source "/tmp/shared_files/jdk-7u10-linux-x64.rpm"
  action :install
  provider Chef::Provider::Package::Rpm
end
