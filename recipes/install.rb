#
# Cookbook:: pathfinder-node
# Recipe:: install
#
# Copyright:: 2018, Pathfinder CM.
#
#

if Chef::VERSION.split('.')[0].to_i > 12
  apt_update
else
  apt_update 'apt update' do
    action :update
  end
end

package 'zfsutils-linux'

execute 'remove default lxd' do
  command "sudo apt-get purge lxd* -y"
end

execute 'install lxd using snap' do
  command "sudo snap install lxd --channel=#{node[cookbook_name]['lxd_snap_channel']}"
end

execute "reschedule snap refresh time" do
  command "sudo snap set system refresh.timer=wed5,23:00-01:00"
end