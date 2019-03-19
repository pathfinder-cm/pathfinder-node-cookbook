#
# Cookbook:: pathfinder-node
# Recipe:: registry_node
#
# Copyright:: 2019, Pathfinder CM.
#
#

include_recipe "#{cookbook_name}::install"

template '/etc/default/lxd_preseed.yml' do
  source 'etc/default/registry_node_preseed.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(:lxd_bind_address =>  node[cookbook_name][:lxd_bind_address],
            :lxd_trust_password => node[cookbook_name][:lxd_trust_password])
end

execute "wait for LXD to be initialized" do
  command "sleep 10"
end

execute 'create preseed-finished' do
  command 'touch /var/snap/lxd/common/lxd/preseed-finished'
  user 'root'
  group 'root'
  action :nothing
end

execute 'lxd init' do
  not_if { ::File.exist?('/var/snap/lxd/common/lxd/preseed-finished') }
  command "cat /etc/default/lxd_preseed.yml | sudo lxd init --preseed"
  notifies :run, 'execute[create preseed-finished]', :immediately
end

include_recipe "#{cookbook_name}::optimize"

systemd_unit 'snap.lxd.daemon.service' do
  content node[cookbook_name]['lxd_systemd_unit']
  action [:create, :restart]
end
