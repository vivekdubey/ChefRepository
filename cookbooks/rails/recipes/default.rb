#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "ruby" do
   action :install
end
package "rubygems" do 
   action :install
end
gem_package "chef" do
    action  :install
end
gem_package "rails" do
   action :install
end
