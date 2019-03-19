#
# Cookbook:: pathfinder-node
# Recipe:: assign_lxd_groups
#
# Copyright:: 2019, Pathfinder CM.
#
#

group 'lxd' do
  append  true
  members node[cookbook_name][:lxd_users]
  action  :manage
end
