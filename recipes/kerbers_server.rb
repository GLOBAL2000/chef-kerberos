package 'krb5-admin-server'

%w(krb5-admin-server krb5-kdc).each do |k|
  service k do
    action :enable
    supports :restart => true, :reload => true
  end
end


%w(/etc/krb5kdc/kdc.conf /etc/krb5kdc/kadm5.acl).each do |t|
  template t do
    owner "root"
    group "root"
    mode 00644
    notifies :restart, "service[krb5-admin-server]"
    notifies :restart, "service[krb5-kdc]"
  end
end
