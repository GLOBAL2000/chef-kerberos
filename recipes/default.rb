package "krb5-user"

template "/etc/krb5.conf" do
  source "krb5.conf.erb"
  mode 0755
  owner "root"
  group "root"
  only_if { !node[:kerberos][:default_realm].empty? }
end

package "libpam-krb5" do
  response_file "libpam-krb5.seed"
end

execute "no krb in pam by default" do
  command "pam-auth-update --remove krb5"
end

k5login node[:kerberos][:machine_admins]
