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

# Since this is a potential security risk do not install by default
# and ensure it is purged if not wanted
if node["kerberos"]["pam"]
    execute "activate krb pam" do
      command "pam-auth-update --package"
    end
else
    execute "deactivate krb in pam" do
      command "pam-auth-update --remove krb5"
    end
end

k5login node[:kerberos][:machine_admins]

