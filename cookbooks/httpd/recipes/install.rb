package 'httpd' do
    action :install
    not_if "ls /usr/sbin/httpd"
    notifies :enable, "service[httpd]", :immediately
    notifies :restart, "service[httpd]", :immediately
end

service 'httpd'