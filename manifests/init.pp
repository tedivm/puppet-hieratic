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

class hieratic (
  $global_enable = true,
  $firewall_label = firewall,
  $firewall_enabled = false,
  $firewall_pre_label = firewall_pre,
  $firewall_pre_enabled = false,
  $firewall_post_label = firewall_post,
  $firewall_post_enabled = false,
  $augeas_label = 'augeas',
  $augeas_enabled = false,
  $class_label = 'class',
  $class_enabled = false,
  $computers_label = 'computers',
  $computers_enabled = false,
  $cron_label = 'cron',
  $cron_enabled = false,
  $exec_label = 'exec',
  $exec_enabled = false,
  $file_label = 'file',
  $file_enabled = false,
  $file_line_label = 'file_line',
  $file_line_enabled = false,
  $filebucket_label = 'filebucket',
  $filebucket_enabled = false,
  $group_label = 'group',
  $group_enabled = false,
  $host_label = 'host',
  $host_enabled = false,
  $interface_label = 'interface',
  $interface_enabled = false,
  $k5login_label = 'k5login',
  $k5login_enabled = false,
  $macauthorization_label = 'macauthorization',
  $macauthorization_enabled = false,
  $mailalias_label = 'mailalias',
  $mailalias_enabled = false,
  $maillist_label = 'maillist',
  $maillist_enabled = false,
  $mcx_label = 'mcx',
  $mcx_enabled = false,
  $mount_label = 'mount',
  $mount_enabled = false,
  $nagios_command_label = 'nagios_command',
  $nagios_command_enabled = false,
  $nagios_contact_label = 'nagios_contact',
  $nagios_contact_enabled = false,
  $nagios_contactgroup_label = 'nagios_contactgroup',
  $nagios_contactgroup_enabled = false,
  $nagios_hostdependency_label = 'nagios_hostdependency',
  $nagios_hostdependency_enabled = false,
  $nagios_hostdependency_label = 'nagios_hostdependency',
  $nagios_hostdependency_enabled = false,
  $nagios_hostescalation_label = 'nagios_hostescalation',
  $nagios_hostescalation_enabled = false,
  $nagios_hostextinfo_label = 'nagios_hostextinfo',
  $nagios_hostextinfo_enabled = false,
  $nagios_hostgroup_label = 'nagios_hostgroup',
  $nagios_hostgroup_enabled = false,
  $nagios_hosts_label = 'nagios_hosts',
  $nagios_hosts_enabled = false,
  $nagios_service_label = 'nagios_service',
  $nagios_service_enabled = false,
  $nagios_servicedependency_label = 'nagios_servicedependency',
  $nagios_servicedependency_enabled = false,
  $nagios_serviceescalation_label = 'nagios_serviceescalation',
  $nagios_serviceescalation_enabled = false,
  $nagios_serviceextinfo_label = 'nagios_serviceextinfo',
  $nagios_serviceextinfo_enabled = false,
  $nagios_servicegroup_label = 'nagios_servicegroup',
  $nagios_servicegroup_enabled = false,
  $nagios_timeperiod_label = 'nagios_timeperiod',
  $nagios_timeperiod_enabled = false,
  $ngios_host_label = 'ngios_host',
  $ngios_host_enabled = false,
  $notify_label = 'notify',
  $notify_enabled = false,
  $package_label = 'package',
  $package_enabled = false,
  $resources_label = 'resources',
  $resources_enabled = false,
  $router_label = 'router',
  $router_enabled = false,
  $schedule_label = 'schedule',
  $schedule_enabled = false,
  $scheduled_task_label = 'scheduled_task',
  $scheduled_task_enabled = false,
  $selboolean_label = 'selboolean',
  $selboolean_enabled = false,
  $selmodule_label = 'selmodule',
  $selmodule_enabled = false,
  $service_label = 'service',
  $service_enabled = false,
  $ssh_authorized_key_label = 'ssh_authorized_key',
  $ssh_authorized_key_enabled = false,
  $ssh_key_label = 'ssh_key',
  $ssh_key_enabled = false,
  $stage_label = 'stage',
  $stage_enabled = false,
  $tidy_label = 'tidy',
  $tidy_enabled = false,
  $user_label = 'user',
  $user_enabled = false,
  $vlan_label = 'vlan',
  $vlan_enabled = false,
  $yumrepo_label = 'yumrepo',
  $yumrepo_enabled = false,
  $zfs_label = 'zfs',
  $zfs_enabled = false,
  $zone_label = 'zone',
  $zone_enabled = false,
  $zpool_label = 'zpool',
  $zpool_enabled = false,
) {

  if(defined('augeas') and ($augeas_enabled or $global_enable)) {
    $augeas_config = hiera_hash($augeas_label, {})
    create_resources('augeas', $augeas_config)
  }

  if(defined('class') and ($class_enabled or $global_enable)) {
    $class_config = hiera_hash($class_label, {})
    create_resources('class', $class_config)
  }

  if(defined('computers') and ($computers_enabled or $global_enable)) {
    $computers_config = hiera_hash($computers_label, {})
    create_resources('computers', $computers_config)
  }

  if(defined('cron') and ($cron_enabled or $global_enable)) {
    $cron_config = hiera_hash($cron_label, {})
    create_resources('cron', $cron_config)
  }

  if(defined('exec') and ($exec_enabled or $global_enable)) {
    $exec_config = hiera_hash($exec_label, {})
    create_resources('exec', $exec_config)
  }

  if(defined('file') and ($file_enabled or $global_enable)) {
    $file_config = hiera_hash($file_label, {})
    create_resources('file', $file_config)
  }

  if(defined('file_line') and ($file_line_enabled or $global_enable)) {
    $file_line_config = hiera_hash($file_line_label, {})
    create_resources('file_line', $file_line_config)
  }

  if(defined('filebucket') and ($filebucket_enabled or $global_enable)) {
    $filebucket_config = hiera_hash($filebucket_label, {})
    create_resources('filebucket', $filebucket_config)
  }

  if(defined('group') and ($group_enabled or $global_enable)) {
    $group_config = hiera_hash($group_label, {})
    create_resources('group', $group_config)
  }

  if(defined('host') and ($host_enabled or $global_enable)) {
    $host_config = hiera_hash($host_label, {})
    create_resources('host', $host_config)
  }

  if(defined('interface') and ($interface_enabled or $global_enable)) {
    $interface_config = hiera_hash($interface_label, {})
    create_resources('interface', $interface_config)
  }

  if(defined('k5login') and ($k5login_enabled or $global_enable)) {
    $k5login_config = hiera_hash($k5login_label, {})
    create_resources('k5login', $k5login_config)
  }

  if(defined('macauthorization') and ($macauthorization_enabled or $global_enable)) {
    $macauthorization_config = hiera_hash($macauthorization_label, {})
    create_resources('macauthorization', $macauthorization_config)
  }

  if(defined('mailalias') and ($mailalias_enabled or $global_enable)) {
    $mailalias_config = hiera_hash($mailalias_label, {})
    create_resources('mailalias', $mailalias_config)
  }

  if(defined('maillist') and ($maillist_enabled or $global_enable)) {
    $maillist_config = hiera_hash($maillist_label, {})
    create_resources('maillist', $maillist_config)
  }

  if(defined('mcx') and ($mcx_enabled or $global_enable)) {
    $mcx_config = hiera_hash($mcx_label, {})
    create_resources('mcx', $mcx_config)
  }

  if(defined('mount') and ($mount_enabled or $global_enable)) {
    $mount_config = hiera_hash($mount_label, {})
    create_resources('mount', $mount_config)
  }

  if(defined('nagios_command') and ($nagios_command_enabled or $global_enable)) {
    $nagios_command_config = hiera_hash($nagios_command_label, {})
    create_resources('nagios_command', $nagios_command_config)
  }

  if(defined('nagios_contact') and ($nagios_contact_enabled or $global_enable)) {
    $nagios_contact_config = hiera_hash($nagios_contact_label, {})
    create_resources('nagios_contact', $nagios_contact_config)
  }

  if(defined('nagios_contactgroup') and ($nagios_contactgroup_enabled or $global_enable)) {
    $nagios_contactgroup_config = hiera_hash($nagios_contactgroup_label, {})
    create_resources('nagios_contactgroup', $nagios_contactgroup_config)
  }

  if(defined('nagios_hostdependency') and ($nagios_hostdependency_enabled or $global_enable)) {
    $nagios_hostdependency_config = hiera_hash($nagios_hostdependency_label, {})
    create_resources('nagios_hostdependency', $nagios_hostdependency_config)
  }

  if(defined('nagios_hostdependency') and ($nagios_hostdependency_enabled or $global_enable)) {
    $nagios_hostdependency_config = hiera_hash($nagios_hostdependency_label, {})
    create_resources('nagios_hostdependency', $nagios_hostdependency_config)
  }

  if(defined('nagios_hostescalation') and ($nagios_hostescalation_enabled or $global_enable)) {
    $nagios_hostescalation_config = hiera_hash($nagios_hostescalation_label, {})
    create_resources('nagios_hostescalation', $nagios_hostescalation_config)
  }

  if(defined('nagios_hostextinfo') and ($nagios_hostextinfo_enabled or $global_enable)) {
    $nagios_hostextinfo_config = hiera_hash($nagios_hostextinfo_label, {})
    create_resources('nagios_hostextinfo', $nagios_hostextinfo_config)
  }

  if(defined('nagios_hostgroup') and ($nagios_hostgroup_enabled or $global_enable)) {
    $nagios_hostgroup_config = hiera_hash($nagios_hostgroup_label, {})
    create_resources('nagios_hostgroup', $nagios_hostgroup_config)
  }

  if(defined('nagios_hosts') and ($nagios_hosts_enabled or $global_enable)) {
    $nagios_hosts_config = hiera_hash($nagios_hosts_label, {})
    create_resources('nagios_hosts', $nagios_hosts_config)
  }

  if(defined('nagios_service') and ($nagios_service_enabled or $global_enable)) {
    $nagios_service_config = hiera_hash($nagios_service_label, {})
    create_resources('nagios_service', $nagios_service_config)
  }

  if(defined('nagios_servicedependency') and ($nagios_servicedependency_enabled or $global_enable)) {
    $nagios_servicedependency_config = hiera_hash($nagios_servicedependency_label, {})
    create_resources('nagios_servicedependency', $nagios_servicedependency_config)
  }

  if(defined('nagios_serviceescalation') and ($nagios_serviceescalation_enabled or $global_enable)) {
    $nagios_serviceescalation_config = hiera_hash($nagios_serviceescalation_label, {})
    create_resources('nagios_serviceescalation', $nagios_serviceescalation_config)
  }

  if(defined('nagios_serviceextinfo') and ($nagios_serviceextinfo_enabled or $global_enable)) {
    $nagios_serviceextinfo_config = hiera_hash($nagios_serviceextinfo_label, {})
    create_resources('nagios_serviceextinfo', $nagios_serviceextinfo_config)
  }

  if(defined('nagios_servicegroup') and ($nagios_servicegroup_enabled or $global_enable)) {
    $nagios_servicegroup_config = hiera_hash($nagios_servicegroup_label, {})
    create_resources('nagios_servicegroup', $nagios_servicegroup_config)
  }

  if(defined('nagios_timeperiod') and ($nagios_timeperiod_enabled or $global_enable)) {
    $nagios_timeperiod_config = hiera_hash($nagios_timeperiod_label, {})
    create_resources('nagios_timeperiod', $nagios_timeperiod_config)
  }

  if(defined('ngios_host') and ($ngios_host_enabled or $global_enable)) {
    $ngios_host_config = hiera_hash($ngios_host_label, {})
    create_resources('ngios_host', $ngios_host_config)
  }

  if(defined('notify') and ($notify_enabled or $global_enable)) {
    $notify_config = hiera_hash($notify_label, {})
    create_resources('notify', $notify_config)
  }

  if(defined('package') and ($package_enabled or $global_enable)) {
    $package_config = hiera_hash($package_label, {})
    create_resources('package', $package_config)
  }

  if(defined('resources') and ($resources_enabled or $global_enable)) {
    $resources_config = hiera_hash($resources_label, {})
    create_resources('resources', $resources_config)
  }

  if(defined('router') and ($router_enabled or $global_enable)) {
    $router_config = hiera_hash($router_label, {})
    create_resources('router', $router_config)
  }

  if(defined('schedule') and ($schedule_enabled or $global_enable)) {
    $schedule_config = hiera_hash($schedule_label, {})
    create_resources('schedule', $schedule_config)
  }

  if(defined('scheduled_task') and ($scheduled_task_enabled or $global_enable)) {
    $scheduled_task_config = hiera_hash($scheduled_task_label, {})
    create_resources('scheduled_task', $scheduled_task_config)
  }

  if(defined('selboolean') and ($selboolean_enabled or $global_enable)) {
    $selboolean_config = hiera_hash($selboolean_label, {})
    create_resources('selboolean', $selboolean_config)
  }

  if(defined('selmodule') and ($selmodule_enabled or $global_enable)) {
    $selmodule_config = hiera_hash($selmodule_label, {})
    create_resources('selmodule', $selmodule_config)
  }

  if(defined('service') and ($service_enabled or $global_enable)) {
    $service_config = hiera_hash($service_label, {})
    create_resources('service', $service_config)
  }

  if(defined('ssh_authorized_key') and ($ssh_authorized_key_enabled or $global_enable)) {
    $ssh_authorized_key_config = hiera_hash($ssh_authorized_key_label, {})
    create_resources('ssh_authorized_key', $ssh_authorized_key_config)
  }

  if(defined('ssh_key') and ($ssh_key_enabled or $global_enable)) {
    $ssh_key_config = hiera_hash($ssh_key_label, {})
    create_resources('ssh_key', $ssh_key_config)
  }

  if(defined('stage') and ($stage_enabled or $global_enable)) {
    $stage_config = hiera_hash($stage_label, {})
    create_resources('stage', $stage_config)
  }

  if(defined('tidy') and ($tidy_enabled or $global_enable)) {
    $tidy_config = hiera_hash($tidy_label, {})
    create_resources('tidy', $tidy_config)
  }

  if(defined('user') and ($user_enabled or $global_enable)) {
    $user_config = hiera_hash($user_label, {})
    create_resources('user', $user_config)
  }

  if(defined('vlan') and ($vlan_enabled or $global_enable)) {
    $vlan_config = hiera_hash($vlan_label, {})
    create_resources('vlan', $vlan_config)
  }

  if(defined('yumrepo') and ($yumrepo_enabled or $global_enable)) {
    $yumrepo_config = hiera_hash($yumrepo_label, {})
    create_resources('yumrepo', $yumrepo_config)
  }

  if(defined('zfs') and ($zfs_enabled or $global_enable)) {
    $zfs_config = hiera_hash($zfs_label, {})
    create_resources('zfs', $zfs_config)
  }

  if(defined('zone') and ($zone_enabled or $global_enable)) {
    $zone_config = hiera_hash($zone_label, {})
    create_resources('zone', $zone_config)
  }

  if(defined('zpool') and ($zpool_enabled or $global_enable)) {
    $zpool_config = hiera_hash($zpool_label, {})
    create_resources('zpool', $zpool_config)
  }


  class { 'hieratic::firewall':
    global_enable => $global_enable,
    firewall_label => $firewall_label,
    firewall_enabled => $firewall_enabled,
    firewall_pre_label => $firewall_pre_label,
    firewall_pre_enabled => $firewall_pre_enabled,
    firewall_post_label => $firewall_post_label,
    firewall_post_enabled => $firewall_post_enabled,
  }

}
