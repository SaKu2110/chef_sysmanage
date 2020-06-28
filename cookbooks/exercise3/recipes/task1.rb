service 'firewalld' do
    action :restart
end

include_recipe "firewalld::http"
include_recipe "firewalld::https"

service 'firewalld' do
    action :restart
end