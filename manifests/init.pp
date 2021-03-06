# == Class: siteusers
#
# Manage users and groups from hiera data
#
# === Examples
#
#  class { 'siteusers':
#  }
#
# === Authors
#
# Dan Foster <dan@zem.org.uk>
#
# === Copyright
#
# Copyright 2015 Dan Foster, unless otherwise noted.
#
class siteusers (
  $admingroup = $siteusers::params::admingroup
) inherits ::siteusers::params {
  $users = hiera('users',{})
  $groups = hiera('groups',{})

  # Turn all heira users in to virtual users.
  create_resources('group', $groups)
  $user_defaults = {
      managehome => true,
      ensure     => present,
      shell      => '/bin/bash',
  }
  create_resources('user', $users, $user_defaults)

  user { 'root':
      ensure   => 'present',
      uid      => 0,
      gid      => 0,
      shell    => '/bin/bash',
      home     => '/root',
      comment  => 'root',
      password => $::root_pw,
  }

  $ssh_authorized_keys = hiera_hash('ssh_authorized_keys', undef)
  if ($ssh_authorized_keys != undef) {
    create_resources('ssh_authorized_key', $ssh_authorized_keys)
  }

}
