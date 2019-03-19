#
# Cookbook:: pathfinder-node
# Recipe:: add_remote_node
#
# Copyright:: 2019, Pathfinder CM.
#
#

lxc_remote_command = "echo \"y\" | "
lxc_remote_command += " sudo lxc remote add"
lxc_remote_command += " #{node[cookbook_name][:remote_name]}"
lxc_remote_command += " #{node[cookbook_name][:remote_ipaddress]}"
lxc_remote_command += " --password #{node[cookbook_name][:remote_trust_password]}" if node[cookbook_name][:remote_trust_password]
lxc_remote_command += " --public" if node[cookbook_name][:remote_public]

execute 'lxc remote add' do
  command lxc_remote_command
  ignore_failure true
end
