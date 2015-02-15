# == Class: siteusers::params
#
# === Parameters
#
# [admingroup]
# Users who are a member of the admingroup defined here will be realised on all nodes.
#
class siteusers::params {
  $admingroup = 'oper'
}
