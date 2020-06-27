package 'firewalld' do
    action :install
    not_if "ls /usr/sbin/firewalld"
    notifies :enable, "service[firewalld]", :immediately
    notifies :restart, "service[firewalld]", :immediately
end

service 'firewalld'