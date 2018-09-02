# # encoding: utf-8

# Inspec test for recipe pathfinder-node::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe bridge('fan-250') do
  it { should exist }
end

describe file('/etc/default/lxd_preseed.yml') do
  its('mode') { should cmp '0644' }
end

