execute "reload" do
    action :nothing
    command "firewall-cmd --reload"
end

execute "add service https" do
    action :run
    command "firewall-cmd --add-service=https --zone=public --permanent"
    not_if 'grep https\" /etc/firewalld/zones/public.xml'
    notifies :run, resources(:execute => "reload"), :immediately
end