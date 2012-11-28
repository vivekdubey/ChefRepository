cookbook_file "/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6" do
  source "RPM-GPG-KEY-EPEL-6"
  owner "root"
  group "root"
  action :create
  not_if { File.exists? ("/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6") }
end


%w{ epel rbel6 }.each do |repo|
  template "/etc/yum.repos.d/#{repo}.repo" do
    source "#{repo}.repo.erb"
  end
end
include_recipe "basic_install::git_install"
