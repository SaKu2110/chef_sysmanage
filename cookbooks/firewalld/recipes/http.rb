execute "reload" do
    action :nothing
    command "firewall-cmd --reload"
end

execute "add service http" do
    command "firewall-cmd --add-service=http --zone=public --permanent"
    not_if 'grep http\" /etc/firewalld/zones/public.xml'
    notifies :run, resources(:execute => "reload"), :immediately
end