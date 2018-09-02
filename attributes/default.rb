#
# Cookbook:: pathfinder-node
# Attribute:: default
#
# Copyright:: 2018, Pathfinder CM.
#
#

cookbook_name = 'pathfinder-node'

default[cookbook_name]['lxd_snap_channel'] = '3.0/stable'

# default[cookbook_name]['lxd_cluster_address'] = 
# default[cookbook_name]['lxd_cluster_certificate'] = 
default[cookbook_name]['lxd_cluster_password'] = 'ubuntu'
default[cookbook_name]['network_bridge_name'] = 'fan-250'
default[cookbook_name]['underlay_subnet'] = '10.0.0.0/16'
default[cookbook_name]['overlay_subnet'] = '250.0.0.0/8'
# default[cookbook_name]['storage_pool_source'] =
default[cookbook_name]['storage_pool_name'] = 'local'
default[cookbook_name]['storage_pool_driver'] = 'dir'
default[cookbook_name]['ssh_authorized_key'] = ''

