#
# Cookbook Name:: basic_install
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package_name = value_for_platform(
["redhat", "centos", "suse", "fedora" ] => {
  "default" => "git"
},
["ubuntu", "debian"] => {
 "default" => "git-core"
  }
)

package package_name do
  action :install
end
