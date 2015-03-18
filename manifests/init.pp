# == Class: hieratic
#
# Full description of class hieratic here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'hieratic':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class hieratic {


  $augeas = hiera_hash('augeas', {})
  create_resources(augeas, $augeas)

  $classes = hiera_hash('classes', {})
  create_resources('class', $classes)

  $computer = hiera_hash('computers', {})
  create_resources(computer, $computer)

  $cron = hiera_hash('crons', {})
  create_resources(cron, $cron)

  $exec = hiera_hash('execs', {})
  create_resources(exec, $exec)

  $file = hiera_hash('files', {})
  create_resources(file, $file)

  $filebucket = hiera_hash('filebuckets', {})
  create_resources(filebucket, $filebucket)

  $groups = hiera_hash('groups', {})
  create_resources(group, $groups)

  $host = hiera_hash('hosts', {})
  create_resources(host, $host)

  $interface = hiera_hash('interfaces', {})
  create_resources(interface, $interface)

  $k5login = hiera_hash('k5logins', {})
  create_resources(k5login, $k5login)

  $macauthorization = hiera_hash('macauthorizations', {})
  create_resources(macauthorization, $macauthorization)

  $mailalias = hiera_hash('mailaliases', {})
  create_resources(mailalias, $mailalias)

  $maillist = hiera_hash('maillists', {})
  create_resources(maillist, $maillist)

  $mcx = hiera_hash('mcx', {})
  create_resources(mcx, $mcx)

  $mount = hiera_hash('mounts', {})
  create_resources(mount, $mount)

  $nagios_command = hiera_hash('nagios_commands', {})
  create_resources(nagios_command, $nagios_command)

  $nagios_contact = hiera_hash('nagios_contacts', {})
  create_resources(nagios_contact, $nagios_contact)

  $nagios_contactgroup = hiera_hash('nagios_contactgroups', {})
  create_resources(nagios_contactgroup, $nagios_contactgroup)

  $nagios_host = hiera_hash('nagios_hosts', {})
  create_resources(nagios_host, $nagios_host)

  $nagios_hostdependency = hiera_hash('nagios_hostdependencies', {})
  create_resources(nagios_hostdependency, $nagios_hostdependency)

  $nagios_hostescalation = hiera_hash('nagios_hostescalations', {})
  create_resources(nagios_hostescalation, $nagios_hostescalation)

  $nagios_hostextinfo = hiera_hash('nagios_hostextinfo', {})
  create_resources(nagios_hostextinfo, $nagios_hostextinfo)

  $nagios_hostgroup = hiera_hash('nagios_hostgroups', {})
  create_resources(nagios_hostgroup, $nagios_hostgroup)

  $nagios_service = hiera_hash('nagios_services', {})
  create_resources(nagios_service, $nagios_service)

  $nagios_servicedependency = hiera_hash('nagios_servicedependencies', {})
  create_resources(nagios_servicedependency, $nagios_servicedependency)

  $nagios_serviceescalation = hiera_hash('nagios_serviceescalations', {})
  create_resources(nagios_serviceescalation, $nagios_serviceescalation)

  $nagios_serviceextinfo = hiera_hash('nagios_serviceextinfo', {})
  create_resources(nagios_serviceextinfo, $nagios_serviceextinfo)

  $nagios_servicegroup = hiera_hash('nagios_servicegroups', {})
  create_resources(nagios_servicegroup, $nagios_servicegroup)

  $nagios_timeperiod = hiera_hash('nagios_timeperiods', {})
  create_resources(nagios_timeperiod, $nagios_timeperiod)

  $notify = hiera_hash('notifies', {})
  create_resources(notify, $notify)

  $packages = hiera_hash('packages', {})
  create_resources(package, $packages)

  $resources = hiera_hash('resources', {})
  create_resources(resources, $resources)

  $router = hiera_hash('routers', {})
  create_resources(router, $router)

  $schedule = hiera_hash('schedules', {})
  create_resources(schedule, $schedule)

  $scheduled_task = hiera_hash('scheduled_tasks', {})
  create_resources(scheduled_task, $scheduled_task)

  $selboolean = hiera_hash('selbooleans', {})
  create_resources(selboolean, $selboolean)

  $selmodule = hiera_hash('selmodules', {})
  create_resources(selmodule, $selmodule)

  $service = hiera_hash('services', {})
  create_resources(service, $service)

  $ssh_authorized_key = hiera_hash('ssh_authorized_keys', {})
  create_resources(ssh_authorized_key, $ssh_authorized_key)

  $sshkeys = hiera_hash('sshkeys', {})
  create_resources(ssh_key, $sshkeys)

  $stage = hiera_hash('stages', {})
  create_resources(stage, $stage)

  $tidy = hiera_hash('tidy', {})
  create_resources(tidy, $tidy)

  $users = hiera_hash('users', {})
  create_resources(user, $users)

  $vlan = hiera_hash('vlans', {})
  create_resources(vlan, $vlan)

  $yumrepo = hiera_hash('yumrepos', {})
  create_resources(yumrepo, $yumrepo)

  $zfs = hiera_hash('zfs', {})
  create_resources(zfs, $zfs)

  $zone = hiera_hash('zones', {})
  create_resources(zone, $zone)

  $zpool = hiera_hash('zpools', {})
  create_resources(zpool, $zpool)



  if(defined('firewall')) {
    $firewall = hiera_hash('firewall', {})
    create_resources(firewall, $firewall)
  }


  if(defined('file_line')) {
    $file_line = hiera_hash('file_line', {})
    create_resources(file_line, $file_line)
  }

}
