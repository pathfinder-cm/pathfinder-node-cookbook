#
# Cookbook:: pathfinder-node
# Recipe:: optimize
#
# Copyright:: 2018, Pathfinder CM.
#
#

sysctl 'vm.max_map_count' do
  value 262144
end
