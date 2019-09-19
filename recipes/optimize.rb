#
# Cookbook:: pathfinder-node
# Recipe:: optimize
#
# Copyright:: 2018, Pathfinder CM.
#
#

template '/etc/sysctl.conf' do
  source 'etc/default/sysctl_conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(:max_queued_events => node[cookbook_name][:max_queued_events],
            :max_user_instances => node[cookbook_name][:max_user_instances],
            :max_user_watches => node[cookbook_name][:max_user_watches],
            :max_map_count => node[cookbook_name][:max_map_count],
            :dmesg_restrict => node[cookbook_name][:dmesg_restrict],
            :ipv4_gc_thresh3 => node[cookbook_name][:ipv4_gc_thresh3],
            :ipv6_gc_thresh3 => node[cookbook_name][:ipv6_gc_thresh3],
            :maxkeys => node[cookbook_name][:maxkeys]
            )
end

template '/etc/security/limits.conf' do
  source 'etc/default/limits.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(:soft_nofile => node[cookbook_name][:soft_nofile],
            :hard_nofile => node[cookbook_name][:hard_nofile],
            :root_soft_nofile => node[cookbook_name][:root_soft_nofile],
            :root_hard_nofile => node[cookbook_name][:root_hard_nofile],
            :soft_memlock => node[cookbook_name][:soft_memlock],
            :hard_memlock => node[cookbook_name][:hard_memlock])
end

reboot 'app_requires_reboot' do
  action :request_reboot
  reason 'Need to reboot when the run completes successfully.'
  delay_mins 5
end