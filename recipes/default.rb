package "krb5-user"

template "/etc/krb5.conf" do
  source "krb5.conf.erb"
  mode 0755
  owner "root"
  group "root"
  only_if { !node[:kerberos][:default_realm].empty? }
end

if node ["kerberos"]["pam"]
  package "libpam-krb5" do
    response_file "libpam-krb5.seed"
  end
end

k5login node[:kerberos][:machine_admins]
