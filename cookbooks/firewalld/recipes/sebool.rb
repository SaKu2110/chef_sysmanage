execute "enable selimux" do
    command "setsebool -P httpd_enable_homedirs on"
    not_if 'getsebool -a | grep "httpd_enable_homedirs --> on"'
end