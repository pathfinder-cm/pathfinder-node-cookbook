#
# Cookbook:: pathfinder-node
# Recipe:: first_node
#
# Copyright:: 2018, Pathfinder CM.
#
#

if node[cookbook_name][:custom_ipaddress].nil?
  node_ipaddress = node[:ipaddress]
else
  node_ipaddress = node[cookbook_name][:custom_ipaddress]
end

include_recipe "#{cookbook_name}::install"
