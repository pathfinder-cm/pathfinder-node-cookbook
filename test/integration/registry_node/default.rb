# # encoding: utf-8

# Inspec test for recipe pathfinder-node::registry_node

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('/etc/default/lxd_preseed.yml') do
  its('mode') { should cmp '0644' }
end

describe command('sysctl vm.max_map_count') do
  its('stdout') { should eq "vm.max_map_count = 262144\n" }
end
