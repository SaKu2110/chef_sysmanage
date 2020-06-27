
template '/etc/httpd/conf.d/userdir.conf' do
    source 'etc/httpd/conf.d/userdir.conf'
    owner  'root'
    group  'root'
    mode   '0644'
    not_if 'grep "#UserDir disabled" /etc/httpd/conf.d/userdir.conf'
    notifies :reload, "service[httpd]", :immediately
    notifies :restart, "service[httpd]", :immediately
end

service 'httpd'