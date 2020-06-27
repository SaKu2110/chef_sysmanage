include_recipe "selinux::enable"
include_recipe "firewalld::sebool"

include_recipe "httpd::userdir"

members = data_bag('members')
members.each do |id|
    data = data_bag_item('members', id)
    execute "settag" do
        action :nothing
        command "chcon -R -h -t httpd_sys_content_t /home/#{data['id']}/html/"
    end
    execute "ChangePermissions" do
        action :nothing
        command "chmod 0711 /home/#{data['id']}"
    end
    directory "/home/#{data['id']}/html" do
        owner "#{data['id']}"
        group "#{data['id']}"
        mode '0755'
        recursive true
    end
    template "/home/#{data['id']}/html/index.html" do
        owner "#{data['id']}"
        mode  0644
        source 'index.html.erb'
        variables({
          :id => data['id'],
          :name => data['name']
        })
        notifies :run, resources(:execute => "settag"), :immediately
        notifies :run, resources(:execute => "ChangePermissions"), :immediately
    end
end