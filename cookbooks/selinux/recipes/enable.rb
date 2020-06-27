execute "enable selimux" do
    command "setenforce 1"
    not_if 'getenforce | grep Enforcing'
end