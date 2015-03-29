# == Class: hieratic
#
# Hieratic allows Puppet Resources to be created directly in Hiera.
#
# === Parameters
#
#  [*global_enable*]
#    Defaults to true. With this on all resources are exposed through Hiera.
#    For granular control set this to false and manually enable specific
#    resource types.
#
#  [*prefix*]
#    Defaults to ''. This string gets added to all of the various `TYPE_label`
#    keys in hiera.
#
#  [*TYPE_enable*]
#    Defaults to true. With this on all resources are exposed through Hiera.
#
#  [*TYPE_label*]
#    Defaults to the name of the type. This defines the top level hiera variable
#    name to use when defining values of this type.
#
#  [*TYPE_defaults*]
#    Defaults to and empty array. This allows default values to be set for each
#    resource type.
#
# === Examples
#
#  include hieratic
#
#  class { 'hieratic':
#    global_enable => false,
#    class_enable => true,
#    class_label => 'classes',
#    file_enable => true,
#  }
#
# === Authors
#
# Robert Hafner <tedivm@tedivm.com>
#
# === Copyright
#
# Copyright 2015 Robert Hafner
#

class hieratic (
  $global_enable = true,
  $prefix = '',
  $firewall_label = 'firewall',
  $firewall_enabled = false,
  $firewall_defaults = {},
  $firewall_pre_label = 'firewall_pre',
  $firewall_pre_enabled = false,
  $firewall_pre_defaults = {},
  $firewall_post_label = 'firewall_post',
  $firewall_post_enabled = false,
  $firewall_post_defaults = {},
  $acl_label =
    'acl',
  $acl_defaults = {},
  $acl_enabled = false,
  $apache_balancer_label =
    'apache_balancer',
  $apache_balancer_defaults = {},
  $apache_balancer_enabled = false,
  $apache_balancermember_label =
    'apache_balancermember',
  $apache_balancermember_defaults = {},
  $apache_balancermember_enabled = false,
  $apache_listen_label =
    'apache_listen',
  $apache_listen_defaults = {},
  $apache_listen_enabled = false,
  $apache_mod_label =
    'apache_mod',
  $apache_mod_defaults = {},
  $apache_mod_enabled = false,
  $apache_namevirtualhost_label =
    'apache_namevirtualhost',
  $apache_namevirtualhost_defaults = {},
  $apache_namevirtualhost_enabled = false,
  $apache_vhost_label =
    'apache_vhost',
  $apache_vhost_defaults = {},
  $apache_vhost_enabled = false,
  $apt_builddep_label =
    'apt_builddep',
  $apt_builddep_defaults = {},
  $apt_builddep_enabled = false,
  $apt_conf_label =
    'apt_conf',
  $apt_conf_defaults = {},
  $apt_conf_enabled = false,
  $apt_force_label =
    'apt_force',
  $apt_force_defaults = {},
  $apt_force_enabled = false,
  $apt_hold_label =
    'apt_hold',
  $apt_hold_defaults = {},
  $apt_hold_enabled = false,
  $apt_key_label =
    'apt_key',
  $apt_key_defaults = {},
  $apt_key_enabled = false,
  $apt_pin_label =
    'apt_pin',
  $apt_pin_defaults = {},
  $apt_pin_enabled = false,
  $apt_ppa_label =
    'apt_ppa',
  $apt_ppa_defaults = {},
  $apt_ppa_enabled = false,
  $apt_source_label =
    'apt_source',
  $apt_source_defaults = {},
  $apt_source_enabled = false,
  $augeas_label =
    'augeas',
  $augeas_defaults = {},
  $augeas_enabled = false,
  $class_label =
    'class',
  $class_defaults = {},
  $class_enabled = false,
  $computers_label =
    'computers',
  $computers_defaults = {},
  $computers_enabled = false,
  $concat_label =
    'concat',
  $concat_defaults = {},
  $concat_enabled = false,
  $concat_fragment_label =
    'concat_fragment',
  $concat_fragment_defaults = {},
  $concat_fragment_enabled = false,
  $cron_label =
    'cron',
  $cron_defaults = {},
  $cron_enabled = false,
  $exec_label =
    'exec',
  $exec_defaults = {},
  $exec_enabled = false,
  $file_label =
    'file',
  $file_defaults = {},
  $file_enabled = false,
  $file_line_label =
    'file_line',
  $file_line_defaults = {},
  $file_line_enabled = false,
  $filebucket_label =
    'filebucket',
  $filebucket_defaults = {},
  $filebucket_enabled = false,
  $git_config_label =
    'git_config',
  $git_config_defaults = {},
  $git_config_enabled = false,
  $group_label =
    'group',
  $group_defaults = {},
  $group_enabled = false,
  $host_label =
    'host',
  $host_defaults = {},
  $host_enabled = false,
  $ini_setting_label =
    'ini_setting',
  $ini_setting_defaults = {},
  $ini_setting_enabled = false,
  $ini_subsetting_label =
    'ini_subsetting',
  $ini_subsetting_defaults = {},
  $ini_subsetting_enabled = false,
  $interface_label =
    'interface',
  $interface_defaults = {},
  $interface_enabled = false,
  $java_ks_label =
    'java_ks',
  $java_ks_defaults = {},
  $java_ks_enabled = false,
  $k5login_label =
    'k5login',
  $k5login_defaults = {},
  $k5login_enabled = false,
  $macauthorization_label =
    'macauthorization',
  $macauthorization_defaults = {},
  $macauthorization_enabled = false,
  $mailalias_label =
    'mailalias',
  $mailalias_defaults = {},
  $mailalias_enabled = false,
  $maillist_label =
    'maillist',
  $maillist_defaults = {},
  $maillist_enabled = false,
  $mcx_label =
    'mcx',
  $mcx_defaults = {},
  $mcx_enabled = false,
  $mount_label =
    'mount',
  $mount_defaults = {},
  $mount_enabled = false,
  $mysql_database_label =
    'mysql_database',
  $mysql_database_defaults = {},
  $mysql_database_enabled = false,
  $mysql_grant_label =
    'mysql_grant',
  $mysql_grant_defaults = {},
  $mysql_grant_enabled = false,
  $mysql_plugin_label =
    'mysql_plugin',
  $mysql_plugin_defaults = {},
  $mysql_plugin_enabled = false,
  $mysql_user_label =
    'mysql_user',
  $mysql_user_defaults = {},
  $mysql_user_enabled = false,
  $nagios_command_label =
    'nagios_command',
  $nagios_command_defaults = {},
  $nagios_command_enabled = false,
  $nagios_contact_label =
    'nagios_contact',
  $nagios_contact_defaults = {},
  $nagios_contact_enabled = false,
  $nagios_contactgroup_label =
    'nagios_contactgroup',
  $nagios_contactgroup_defaults = {},
  $nagios_contactgroup_enabled = false,
  $nagios_host_label =
    'nagios_host',
  $nagios_host_defaults = {},
  $nagios_host_enabled = false,
  $nagios_hostdependency_label =
    'nagios_hostdependency',
  $nagios_hostdependency_defaults = {},
  $nagios_hostdependency_enabled = false,
  $nagios_hostescalation_label =
    'nagios_hostescalation',
  $nagios_hostescalation_defaults = {},
  $nagios_hostescalation_enabled = false,
  $nagios_hostextinfo_label =
    'nagios_hostextinfo',
  $nagios_hostextinfo_defaults = {},
  $nagios_hostextinfo_enabled = false,
  $nagios_hostgroup_label =
    'nagios_hostgroup',
  $nagios_hostgroup_defaults = {},
  $nagios_hostgroup_enabled = false,
  $nagios_service_label =
    'nagios_service',
  $nagios_service_defaults = {},
  $nagios_service_enabled = false,
  $nagios_servicedependency_label =
    'nagios_servicedependency',
  $nagios_servicedependency_defaults = {},
  $nagios_servicedependency_enabled = false,
  $nagios_serviceescalation_label =
    'nagios_serviceescalation',
  $nagios_serviceescalation_defaults = {},
  $nagios_serviceescalation_enabled = false,
  $nagios_serviceextinfo_label =
    'nagios_serviceextinfo',
  $nagios_serviceextinfo_defaults = {},
  $nagios_serviceextinfo_enabled = false,
  $nagios_servicegroup_label =
    'nagios_servicegroup',
  $nagios_servicegroup_defaults = {},
  $nagios_servicegroup_enabled = false,
  $nagios_timeperiod_label =
    'nagios_timeperiod',
  $nagios_timeperiod_defaults = {},
  $nagios_timeperiod_enabled = false,
  $notify_label =
    'notify',
  $notify_defaults = {},
  $notify_enabled = false,
  $package_label =
    'package',
  $package_defaults = {},
  $package_enabled = false,
  $postgresql_server_config_entry_label =
    'postgresql_server_config_entry',
  $postgresql_server_config_entry_defaults = {},
  $postgresql_server_config_entry_enabled = false,
  $postgresql_server_database_label =
    'postgresql_server_database',
  $postgresql_server_database_defaults = {},
  $postgresql_server_database_enabled = false,
  $postgresql_server_database_grant_label =
    'postgresql_server_database_grant',
  $postgresql_server_database_grant_defaults = {},
  $postgresql_server_database_grant_enabled = false,
  $postgresql_server_db_label =
    'postgresql_server_db',
  $postgresql_server_db_defaults = {},
  $postgresql_server_db_enabled = false,
  $postgresql_server_extension_label =
    'postgresql_server_extension',
  $postgresql_server_extension_defaults = {},
  $postgresql_server_extension_enabled = false,
  $postgresql_server_pg_hba_rule_label =
    'postgresql_server_pg_hba_rule',
  $postgresql_server_pg_hba_rule_defaults = {},
  $postgresql_server_pg_hba_rule_enabled = false,
  $postgresql_server_pg_ident_rule_label =
    'postgresql_server_pg_ident_rule',
  $postgresql_server_pg_ident_rule_defaults = {},
  $postgresql_server_pg_ident_rule_enabled = false,
  $postgresql_server_role_label =
    'postgresql_server_role',
  $postgresql_server_role_defaults = {},
  $postgresql_server_role_enabled = false,
  $postgresql_server_schema_label =
    'postgresql_server_schema',
  $postgresql_server_schema_defaults = {},
  $postgresql_server_schema_enabled = false,
  $postgresql_server_table_grant_label =
    'postgresql_server_table_grant',
  $postgresql_server_table_grant_defaults = {},
  $postgresql_server_table_grant_enabled = false,
  $postgresql_server_tablespace_label =
    'postgresql_server_tablespace',
  $postgresql_server_tablespace_defaults = {},
  $postgresql_server_tablespace_enabled = false,
  $postgresql_validate_db_connection_label =
    'postgresql_validate_db_connection',
  $postgresql_validate_db_connection_defaults = {},
  $postgresql_validate_db_connection_enabled = false,
  $postgresql_conf_label =
    'postgresql_conf',
  $postgresql_conf_defaults = {},
  $postgresql_conf_enabled = false,
  $postgresql_psql_label =
    'postgresql_psql',
  $postgresql_psql_defaults = {},
  $postgresql_psql_enabled = false,
  $postgresql_replication_slot_label =
    'postgresql_replication_slot',
  $postgresql_replication_slot_defaults = {},
  $postgresql_replication_slot_enabled = false,
  $registry_value_label =
    'registry_value',
  $registry_value_defaults = {},
  $registry_value_enabled = false,
  $resources_label =
    'resources',
  $resources_defaults = {},
  $resources_enabled = false,
  $router_label =
    'router',
  $router_defaults = {},
  $router_enabled = false,
  $rsync_get_label =
    'rsync_get',
  $rsync_get_defaults = {},
  $rsync_get_enabled = false,
  $rsync_put_label =
    'rsync_put',
  $rsync_put_defaults = {},
  $rsync_put_enabled = false,
  $rsync_server_module_label =
    'rsync_server_module',
  $rsync_server_module_defaults = {},
  $rsync_server_module_enabled = false,
  $schedule_label =
    'schedule',
  $schedule_defaults = {},
  $schedule_enabled = false,
  $scheduled_task_label =
    'scheduled_task',
  $scheduled_task_defaults = {},
  $scheduled_task_enabled = false,
  $selboolean_label =
    'selboolean',
  $selboolean_defaults = {},
  $selboolean_enabled = false,
  $selmodule_label =
    'selmodule',
  $selmodule_defaults = {},
  $selmodule_enabled = false,
  $service_label =
    'service',
  $service_defaults = {},
  $service_enabled = false,
  $ssh_authorized_key_label =
    'ssh_authorized_key',
  $ssh_authorized_key_defaults = {},
  $ssh_authorized_key_enabled = false,
  $ssh_key_label =
    'ssh_key',
  $ssh_key_defaults = {},
  $ssh_key_enabled = false,
  $stage_label =
    'stage',
  $stage_defaults = {},
  $stage_enabled = false,
  $tidy_label =
    'tidy',
  $tidy_defaults = {},
  $tidy_enabled = false,
  $user_label =
    'user',
  $user_defaults = {},
  $user_enabled = false,
  $vcsrepo_label =
    'vcsrepo',
  $vcsrepo_defaults = {},
  $vcsrepo_enabled = false,
  $vlan_label =
    'vlan',
  $vlan_defaults = {},
  $vlan_enabled = false,
  $yumrepo_label =
    'yumrepo',
  $yumrepo_defaults = {},
  $yumrepo_enabled = false,
  $zfs_label =
    'zfs',
  $zfs_defaults = {},
  $zfs_enabled = false,
  $zone_label =
    'zone',
  $zone_defaults = {},
  $zone_enabled = false,
  $zpool_label =
    'zpool',
  $zpool_defaults = {},
  $zpool_enabled = false,
) {

  if(defined('acl')
    and ($acl_enabled
      or $global_enable)) {

        $acl_config =
          hiera_hash("${prefix}${acl_label}",
            $acl_defaults)

        create_resources('acl',
          $acl_config)
  }

  if(defined('apache::balancer')
    and ($apache_balancer_enabled
      or $global_enable)) {

        $apache_balancer_config =
          hiera_hash("${prefix}${apache_balancer_label}",
            $apache_balancer_defaults)

        create_resources('apache::balancer',
          $apache_balancer_config)
  }

  if(defined('apache::balancermember')
    and ($apache_balancermember_enabled
      or $global_enable)) {

        $apache_balancermember_config =
          hiera_hash("${prefix}${apache_balancermember_label}",
            $apache_balancermember_defaults)

        create_resources('apache::balancermember',
          $apache_balancermember_config)
  }

  if(defined('apache::listen')
    and ($apache_listen_enabled
      or $global_enable)) {

        $apache_listen_config =
          hiera_hash("${prefix}${apache_listen_label}",
            $apache_listen_defaults)

        create_resources('apache::listen',
          $apache_listen_config)
  }

  if(defined('apache::mod')
    and ($apache_mod_enabled
      or $global_enable)) {

        $apache_mod_config =
          hiera_hash("${prefix}${apache_mod_label}",
            $apache_mod_defaults)

        create_resources('apache::mod',
          $apache_mod_config)
  }

  if(defined('apache::namevirtualhost')
    and ($apache_namevirtualhost_enabled
      or $global_enable)) {

        $apache_namevirtualhost_config =
          hiera_hash("${prefix}${apache_namevirtualhost_label}",
            $apache_namevirtualhost_defaults)

        create_resources('apache::namevirtualhost',
          $apache_namevirtualhost_config)
  }

  if(defined('apache::vhost')
    and ($apache_vhost_enabled
      or $global_enable)) {

        $apache_vhost_config =
          hiera_hash("${prefix}${apache_vhost_label}",
            $apache_vhost_defaults)

        create_resources('apache::vhost',
          $apache_vhost_config)
  }

  if(defined('apt::builddep')
    and ($apt_builddep_enabled
      or $global_enable)) {

        $apt_builddep_config =
          hiera_hash("${prefix}${apt_builddep_label}",
            $apt_builddep_defaults)

        create_resources('apt::builddep',
          $apt_builddep_config)
  }

  if(defined('apt::conf')
    and ($apt_conf_enabled
      or $global_enable)) {

        $apt_conf_config =
          hiera_hash("${prefix}${apt_conf_label}",
            $apt_conf_defaults)

        create_resources('apt::conf',
          $apt_conf_config)
  }

  if(defined('apt::force')
    and ($apt_force_enabled
      or $global_enable)) {

        $apt_force_config =
          hiera_hash("${prefix}${apt_force_label}",
            $apt_force_defaults)

        create_resources('apt::force',
          $apt_force_config)
  }

  if(defined('apt::hold')
    and ($apt_hold_enabled
      or $global_enable)) {

        $apt_hold_config =
          hiera_hash("${prefix}${apt_hold_label}",
            $apt_hold_defaults)

        create_resources('apt::hold',
          $apt_hold_config)
  }

  if(defined('apt::key')
    and ($apt_key_enabled
      or $global_enable)) {

        $apt_key_config =
          hiera_hash("${prefix}${apt_key_label}",
            $apt_key_defaults)

        create_resources('apt::key',
          $apt_key_config)
  }

  if(defined('apt::pin')
    and ($apt_pin_enabled
      or $global_enable)) {

        $apt_pin_config =
          hiera_hash("${prefix}${apt_pin_label}",
            $apt_pin_defaults)

        create_resources('apt::pin',
          $apt_pin_config)
  }

  if(defined('apt::ppa')
    and ($apt_ppa_enabled
      or $global_enable)) {

        $apt_ppa_config =
          hiera_hash("${prefix}${apt_ppa_label}",
            $apt_ppa_defaults)

        create_resources('apt::ppa',
          $apt_ppa_config)
  }

  if(defined('apt::source')
    and ($apt_source_enabled
      or $global_enable)) {

        $apt_source_config =
          hiera_hash("${prefix}${apt_source_label}",
            $apt_source_defaults)

        create_resources('apt::source',
          $apt_source_config)
  }

  if(defined('augeas')
    and ($augeas_enabled
      or $global_enable)) {

        $augeas_config =
          hiera_hash("${prefix}${augeas_label}",
            $augeas_defaults)

        create_resources('augeas',
          $augeas_config)
  }

  if(defined('class')
    and ($class_enabled
      or $global_enable)) {

        $class_config =
          hiera_hash("${prefix}${class_label}",
            $class_defaults)

        create_resources('class',
          $class_config)
  }

  if(defined('computers')
    and ($computers_enabled
      or $global_enable)) {

        $computers_config =
          hiera_hash("${prefix}${computers_label}",
            $computers_defaults)

        create_resources('computers',
          $computers_config)
  }

  if(defined('concat')
    and ($concat_enabled
      or $global_enable)) {

        $concat_config =
          hiera_hash("${prefix}${concat_label}",
            $concat_defaults)

        create_resources('concat',
          $concat_config)
  }

  if(defined('concat::fragment')
    and ($concat_fragment_enabled
      or $global_enable)) {

        $concat_fragment_config =
          hiera_hash("${prefix}${concat_fragment_label}",
            $concat_fragment_defaults)

        create_resources('concat::fragment',
          $concat_fragment_config)
  }

  if(defined('cron')
    and ($cron_enabled
      or $global_enable)) {

        $cron_config =
          hiera_hash("${prefix}${cron_label}",
            $cron_defaults)

        create_resources('cron',
          $cron_config)
  }

  if(defined('exec')
    and ($exec_enabled
      or $global_enable)) {

        $exec_config =
          hiera_hash("${prefix}${exec_label}",
            $exec_defaults)

        create_resources('exec',
          $exec_config)
  }

  if(defined('file')
    and ($file_enabled
      or $global_enable)) {

        $file_config =
          hiera_hash("${prefix}${file_label}",
            $file_defaults)

        create_resources('file',
          $file_config)
  }

  if(defined('file_line')
    and ($file_line_enabled
      or $global_enable)) {

        $file_line_config =
          hiera_hash("${prefix}${file_line_label}",
            $file_line_defaults)

        create_resources('file_line',
          $file_line_config)
  }

  if(defined('filebucket')
    and ($filebucket_enabled
      or $global_enable)) {

        $filebucket_config =
          hiera_hash("${prefix}${filebucket_label}",
            $filebucket_defaults)

        create_resources('filebucket',
          $filebucket_config)
  }

  if(defined('git::config')
    and ($git_config_enabled
      or $global_enable)) {

        $git_config_config =
          hiera_hash("${prefix}${git_config_label}",
            $git_config_defaults)

        create_resources('git::config',
          $git_config_config)
  }

  if(defined('group')
    and ($group_enabled
      or $global_enable)) {

        $group_config =
          hiera_hash("${prefix}${group_label}",
            $group_defaults)

        create_resources('group',
          $group_config)
  }

  if(defined('host')
    and ($host_enabled
      or $global_enable)) {

        $host_config =
          hiera_hash("${prefix}${host_label}",
            $host_defaults)

        create_resources('host',
          $host_config)
  }

  if(defined('ini_setting')
    and ($ini_setting_enabled
      or $global_enable)) {

        $ini_setting_config =
          hiera_hash("${prefix}${ini_setting_label}",
            $ini_setting_defaults)

        create_resources('ini_setting',
          $ini_setting_config)
  }

  if(defined('ini_subsetting')
    and ($ini_subsetting_enabled
      or $global_enable)) {

        $ini_subsetting_config =
          hiera_hash("${prefix}${ini_subsetting_label}",
            $ini_subsetting_defaults)

        create_resources('ini_subsetting',
          $ini_subsetting_config)
  }

  if(defined('interface')
    and ($interface_enabled
      or $global_enable)) {

        $interface_config =
          hiera_hash("${prefix}${interface_label}",
            $interface_defaults)

        create_resources('interface',
          $interface_config)
  }

  if(defined('java_ks')
    and ($java_ks_enabled
      or $global_enable)) {

        $java_ks_config =
          hiera_hash("${prefix}${java_ks_label}",
            $java_ks_defaults)

        create_resources('java_ks',
          $java_ks_config)
  }

  if(defined('k5login')
    and ($k5login_enabled
      or $global_enable)) {

        $k5login_config =
          hiera_hash("${prefix}${k5login_label}",
            $k5login_defaults)

        create_resources('k5login',
          $k5login_config)
  }

  if(defined('macauthorization')
    and ($macauthorization_enabled
      or $global_enable)) {

        $macauthorization_config =
          hiera_hash("${prefix}${macauthorization_label}",
            $macauthorization_defaults)

        create_resources('macauthorization',
          $macauthorization_config)
  }

  if(defined('mailalias')
    and ($mailalias_enabled
      or $global_enable)) {

        $mailalias_config =
          hiera_hash("${prefix}${mailalias_label}",
            $mailalias_defaults)

        create_resources('mailalias',
          $mailalias_config)
  }

  if(defined('maillist')
    and ($maillist_enabled
      or $global_enable)) {

        $maillist_config =
          hiera_hash("${prefix}${maillist_label}",
            $maillist_defaults)

        create_resources('maillist',
          $maillist_config)
  }

  if(defined('mcx')
    and ($mcx_enabled
      or $global_enable)) {

        $mcx_config =
          hiera_hash("${prefix}${mcx_label}",
            $mcx_defaults)

        create_resources('mcx',
          $mcx_config)
  }

  if(defined('mount')
    and ($mount_enabled
      or $global_enable)) {

        $mount_config =
          hiera_hash("${prefix}${mount_label}",
            $mount_defaults)

        create_resources('mount',
          $mount_config)
  }

  if(defined('mysql_database')
    and ($mysql_database_enabled
      or $global_enable)) {

        $mysql_database_config =
          hiera_hash("${prefix}${mysql_database_label}",
            $mysql_database_defaults)

        create_resources('mysql_database',
          $mysql_database_config)
  }

  if(defined('mysql_grant')
    and ($mysql_grant_enabled
      or $global_enable)) {

        $mysql_grant_config =
          hiera_hash("${prefix}${mysql_grant_label}",
            $mysql_grant_defaults)

        create_resources('mysql_grant',
          $mysql_grant_config)
  }

  if(defined('mysql_plugin')
    and ($mysql_plugin_enabled
      or $global_enable)) {

        $mysql_plugin_config =
          hiera_hash("${prefix}${mysql_plugin_label}",
            $mysql_plugin_defaults)

        create_resources('mysql_plugin',
          $mysql_plugin_config)
  }

  if(defined('mysql_user')
    and ($mysql_user_enabled
      or $global_enable)) {

        $mysql_user_config =
          hiera_hash("${prefix}${mysql_user_label}",
            $mysql_user_defaults)

        create_resources('mysql_user',
          $mysql_user_config)
  }

  if(defined('nagios_command')
    and ($nagios_command_enabled
      or $global_enable)) {

        $nagios_command_config =
          hiera_hash("${prefix}${nagios_command_label}",
            $nagios_command_defaults)

        create_resources('nagios_command',
          $nagios_command_config)
  }

  if(defined('nagios_contact')
    and ($nagios_contact_enabled
      or $global_enable)) {

        $nagios_contact_config =
          hiera_hash("${prefix}${nagios_contact_label}",
            $nagios_contact_defaults)

        create_resources('nagios_contact',
          $nagios_contact_config)
  }

  if(defined('nagios_contactgroup')
    and ($nagios_contactgroup_enabled
      or $global_enable)) {

        $nagios_contactgroup_config =
          hiera_hash("${prefix}${nagios_contactgroup_label}",
            $nagios_contactgroup_defaults)

        create_resources('nagios_contactgroup',
          $nagios_contactgroup_config)
  }

  if(defined('nagios_host')
    and ($nagios_host_enabled
      or $global_enable)) {

        $nagios_host_config =
          hiera_hash("${prefix}${nagios_host_label}",
            $nagios_host_defaults)

        create_resources('nagios_host',
          $nagios_host_config)
  }

  if(defined('nagios_hostdependency')
    and ($nagios_hostdependency_enabled
      or $global_enable)) {

        $nagios_hostdependency_config =
          hiera_hash("${prefix}${nagios_hostdependency_label}",
            $nagios_hostdependency_defaults)

        create_resources('nagios_hostdependency',
          $nagios_hostdependency_config)
  }

  if(defined('nagios_hostescalation')
    and ($nagios_hostescalation_enabled
      or $global_enable)) {

        $nagios_hostescalation_config =
          hiera_hash("${prefix}${nagios_hostescalation_label}",
            $nagios_hostescalation_defaults)

        create_resources('nagios_hostescalation',
          $nagios_hostescalation_config)
  }

  if(defined('nagios_hostextinfo')
    and ($nagios_hostextinfo_enabled
      or $global_enable)) {

        $nagios_hostextinfo_config =
          hiera_hash("${prefix}${nagios_hostextinfo_label}",
            $nagios_hostextinfo_defaults)

        create_resources('nagios_hostextinfo',
          $nagios_hostextinfo_config)
  }

  if(defined('nagios_hostgroup')
    and ($nagios_hostgroup_enabled
      or $global_enable)) {

        $nagios_hostgroup_config =
          hiera_hash("${prefix}${nagios_hostgroup_label}",
            $nagios_hostgroup_defaults)

        create_resources('nagios_hostgroup',
          $nagios_hostgroup_config)
  }

  if(defined('nagios_service')
    and ($nagios_service_enabled
      or $global_enable)) {

        $nagios_service_config =
          hiera_hash("${prefix}${nagios_service_label}",
            $nagios_service_defaults)

        create_resources('nagios_service',
          $nagios_service_config)
  }

  if(defined('nagios_servicedependency')
    and ($nagios_servicedependency_enabled
      or $global_enable)) {

        $nagios_servicedependency_config =
          hiera_hash("${prefix}${nagios_servicedependency_label}",
            $nagios_servicedependency_defaults)

        create_resources('nagios_servicedependency',
          $nagios_servicedependency_config)
  }

  if(defined('nagios_serviceescalation')
    and ($nagios_serviceescalation_enabled
      or $global_enable)) {

        $nagios_serviceescalation_config =
          hiera_hash("${prefix}${nagios_serviceescalation_label}",
            $nagios_serviceescalation_defaults)

        create_resources('nagios_serviceescalation',
          $nagios_serviceescalation_config)
  }

  if(defined('nagios_serviceextinfo')
    and ($nagios_serviceextinfo_enabled
      or $global_enable)) {

        $nagios_serviceextinfo_config =
          hiera_hash("${prefix}${nagios_serviceextinfo_label}",
            $nagios_serviceextinfo_defaults)

        create_resources('nagios_serviceextinfo',
          $nagios_serviceextinfo_config)
  }

  if(defined('nagios_servicegroup')
    and ($nagios_servicegroup_enabled
      or $global_enable)) {

        $nagios_servicegroup_config =
          hiera_hash("${prefix}${nagios_servicegroup_label}",
            $nagios_servicegroup_defaults)

        create_resources('nagios_servicegroup',
          $nagios_servicegroup_config)
  }

  if(defined('nagios_timeperiod')
    and ($nagios_timeperiod_enabled
      or $global_enable)) {

        $nagios_timeperiod_config =
          hiera_hash("${prefix}${nagios_timeperiod_label}",
            $nagios_timeperiod_defaults)

        create_resources('nagios_timeperiod',
          $nagios_timeperiod_config)
  }

  if(defined('notify')
    and ($notify_enabled
      or $global_enable)) {

        $notify_config =
          hiera_hash("${prefix}${notify_label}",
            $notify_defaults)

        create_resources('notify',
          $notify_config)
  }

  if(defined('package')
    and ($package_enabled
      or $global_enable)) {

        $package_config =
          hiera_hash("${prefix}${package_label}",
            $package_defaults)

        create_resources('package',
          $package_config)
  }

  if(defined('postgresql::server::config_entry')
    and ($postgresql_server_config_entry_enabled
      or $global_enable)) {

        $postgresql_server_config_entry_config =
          hiera_hash("${prefix}${postgresql_server_config_entry_label}",
            $postgresql_server_config_entry_defaults)

        create_resources('postgresql::server::config_entry',
          $postgresql_server_config_entry_config)
  }

  if(defined('postgresql::server::database')
    and ($postgresql_server_database_enabled
      or $global_enable)) {

        $postgresql_server_database_config =
          hiera_hash("${prefix}${postgresql_server_database_label}",
            $postgresql_server_database_defaults)

        create_resources('postgresql::server::database',
          $postgresql_server_database_config)
  }

  if(defined('postgresql::server::database_grant')
    and ($postgresql_server_database_grant_enabled
      or $global_enable)) {

        $postgresql_server_database_grant_config =
          hiera_hash("${prefix}${postgresql_server_database_grant_label}",
            $postgresql_server_database_grant_defaults)

        create_resources('postgresql::server::database_grant',
          $postgresql_server_database_grant_config)
  }

  if(defined('postgresql::server::db')
    and ($postgresql_server_db_enabled
      or $global_enable)) {

        $postgresql_server_db_config =
          hiera_hash("${prefix}${postgresql_server_db_label}",
            $postgresql_server_db_defaults)

        create_resources('postgresql::server::db',
          $postgresql_server_db_config)
  }

  if(defined('postgresql::server::extension')
    and ($postgresql_server_extension_enabled
      or $global_enable)) {

        $postgresql_server_extension_config =
          hiera_hash("${prefix}${postgresql_server_extension_label}",
            $postgresql_server_extension_defaults)

        create_resources('postgresql::server::extension',
          $postgresql_server_extension_config)
  }

  if(defined('postgresql::server::pg_hba_rule')
    and ($postgresql_server_pg_hba_rule_enabled
      or $global_enable)) {

        $postgresql_server_pg_hba_rule_config =
          hiera_hash("${prefix}${postgresql_server_pg_hba_rule_label}",
            $postgresql_server_pg_hba_rule_defaults)

        create_resources('postgresql::server::pg_hba_rule',
          $postgresql_server_pg_hba_rule_config)
  }

  if(defined('postgresql::server::pg_ident_rule')
    and ($postgresql_server_pg_ident_rule_enabled
      or $global_enable)) {

        $postgresql_server_pg_ident_rule_config =
          hiera_hash("${prefix}${postgresql_server_pg_ident_rule_label}",
            $postgresql_server_pg_ident_rule_defaults)

        create_resources('postgresql::server::pg_ident_rule',
          $postgresql_server_pg_ident_rule_config)
  }

  if(defined('postgresql::server::role')
    and ($postgresql_server_role_enabled
      or $global_enable)) {

        $postgresql_server_role_config =
          hiera_hash("${prefix}${postgresql_server_role_label}",
            $postgresql_server_role_defaults)

        create_resources('postgresql::server::role',
          $postgresql_server_role_config)
  }

  if(defined('postgresql::server::schema')
    and ($postgresql_server_schema_enabled
      or $global_enable)) {

        $postgresql_server_schema_config =
          hiera_hash("${prefix}${postgresql_server_schema_label}",
            $postgresql_server_schema_defaults)

        create_resources('postgresql::server::schema',
          $postgresql_server_schema_config)
  }

  if(defined('postgresql::server::table_grant')
    and ($postgresql_server_table_grant_enabled
      or $global_enable)) {

        $postgresql_server_table_grant_config =
          hiera_hash("${prefix}${postgresql_server_table_grant_label}",
            $postgresql_server_table_grant_defaults)

        create_resources('postgresql::server::table_grant',
          $postgresql_server_table_grant_config)
  }

  if(defined('postgresql::server::tablespace')
    and ($postgresql_server_tablespace_enabled
      or $global_enable)) {

        $postgresql_server_tablespace_config =
          hiera_hash("${prefix}${postgresql_server_tablespace_label}",
            $postgresql_server_tablespace_defaults)

        create_resources('postgresql::server::tablespace',
          $postgresql_server_tablespace_config)
  }

  if(defined('postgresql::validate_db_connection')
    and ($postgresql_validate_db_connection_enabled
      or $global_enable)) {

        $postgresql_validate_db_connection_config =
          hiera_hash("${prefix}${postgresql_validate_db_connection_label}",
            $postgresql_validate_db_connection_defaults)

        create_resources('postgresql::validate_db_connection',
          $postgresql_validate_db_connection_config)
  }

  if(defined('postgresql_conf')
    and ($postgresql_conf_enabled
      or $global_enable)) {

        $postgresql_conf_config =
          hiera_hash("${prefix}${postgresql_conf_label}",
            $postgresql_conf_defaults)

        create_resources('postgresql_conf',
          $postgresql_conf_config)
  }

  if(defined('postgresql_psql')
    and ($postgresql_psql_enabled
      or $global_enable)) {

        $postgresql_psql_config =
          hiera_hash("${prefix}${postgresql_psql_label}",
            $postgresql_psql_defaults)

        create_resources('postgresql_psql',
          $postgresql_psql_config)
  }

  if(defined('postgresql_replication_slot')
    and ($postgresql_replication_slot_enabled
      or $global_enable)) {

        $postgresql_replication_slot_config =
          hiera_hash("${prefix}${postgresql_replication_slot_label}",
            $postgresql_replication_slot_defaults)

        create_resources('postgresql_replication_slot',
          $postgresql_replication_slot_config)
  }

  if(defined('registry::value')
    and ($registry_value_enabled
      or $global_enable)) {

        $registry_value_config =
          hiera_hash("${prefix}${registry_value_label}",
            $registry_value_defaults)

        create_resources('registry::value',
          $registry_value_config)
  }

  if(defined('resources')
    and ($resources_enabled
      or $global_enable)) {

        $resources_config =
          hiera_hash("${prefix}${resources_label}",
            $resources_defaults)

        create_resources('resources',
          $resources_config)
  }

  if(defined('router')
    and ($router_enabled
      or $global_enable)) {

        $router_config =
          hiera_hash("${prefix}${router_label}",
            $router_defaults)

        create_resources('router',
          $router_config)
  }

  if(defined('rsync::get')
    and ($rsync_get_enabled
      or $global_enable)) {

        $rsync_get_config =
          hiera_hash("${prefix}${rsync_get_label}",
            $rsync_get_defaults)

        create_resources('rsync::get',
          $rsync_get_config)
  }

  if(defined('rsync::put')
    and ($rsync_put_enabled
      or $global_enable)) {

        $rsync_put_config =
          hiera_hash("${prefix}${rsync_put_label}",
            $rsync_put_defaults)

        create_resources('rsync::put',
          $rsync_put_config)
  }

  if(defined('rsync::server::module')
    and ($rsync_server_module_enabled
      or $global_enable)) {

        $rsync_server_module_config =
          hiera_hash("${prefix}${rsync_server_module_label}",
            $rsync_server_module_defaults)

        create_resources('rsync::server::module',
          $rsync_server_module_config)
  }

  if(defined('schedule')
    and ($schedule_enabled
      or $global_enable)) {

        $schedule_config =
          hiera_hash("${prefix}${schedule_label}",
            $schedule_defaults)

        create_resources('schedule',
          $schedule_config)
  }

  if(defined('scheduled_task')
    and ($scheduled_task_enabled
      or $global_enable)) {

        $scheduled_task_config =
          hiera_hash("${prefix}${scheduled_task_label}",
            $scheduled_task_defaults)

        create_resources('scheduled_task',
          $scheduled_task_config)
  }

  if(defined('selboolean')
    and ($selboolean_enabled
      or $global_enable)) {

        $selboolean_config =
          hiera_hash("${prefix}${selboolean_label}",
            $selboolean_defaults)

        create_resources('selboolean',
          $selboolean_config)
  }

  if(defined('selmodule')
    and ($selmodule_enabled
      or $global_enable)) {

        $selmodule_config =
          hiera_hash("${prefix}${selmodule_label}",
            $selmodule_defaults)

        create_resources('selmodule',
          $selmodule_config)
  }

  if(defined('service')
    and ($service_enabled
      or $global_enable)) {

        $service_config =
          hiera_hash("${prefix}${service_label}",
            $service_defaults)

        create_resources('service',
          $service_config)
  }

  if(defined('ssh_authorized_key')
    and ($ssh_authorized_key_enabled
      or $global_enable)) {

        $ssh_authorized_key_config =
          hiera_hash("${prefix}${ssh_authorized_key_label}",
            $ssh_authorized_key_defaults)

        create_resources('ssh_authorized_key',
          $ssh_authorized_key_config)
  }

  if(defined('ssh_key')
    and ($ssh_key_enabled
      or $global_enable)) {

        $ssh_key_config =
          hiera_hash("${prefix}${ssh_key_label}",
            $ssh_key_defaults)

        create_resources('ssh_key',
          $ssh_key_config)
  }

  if(defined('stage')
    and ($stage_enabled
      or $global_enable)) {

        $stage_config =
          hiera_hash("${prefix}${stage_label}",
            $stage_defaults)

        create_resources('stage',
          $stage_config)
  }

  if(defined('tidy')
    and ($tidy_enabled
      or $global_enable)) {

        $tidy_config =
          hiera_hash("${prefix}${tidy_label}",
            $tidy_defaults)

        create_resources('tidy',
          $tidy_config)
  }

  if(defined('user')
    and ($user_enabled
      or $global_enable)) {

        $user_config =
          hiera_hash("${prefix}${user_label}",
            $user_defaults)

        create_resources('user',
          $user_config)
  }

  if(defined('vcsrepo')
    and ($vcsrepo_enabled
      or $global_enable)) {

        $vcsrepo_config =
          hiera_hash("${prefix}${vcsrepo_label}",
            $vcsrepo_defaults)

        create_resources('vcsrepo',
          $vcsrepo_config)
  }

  if(defined('vlan')
    and ($vlan_enabled
      or $global_enable)) {

        $vlan_config =
          hiera_hash("${prefix}${vlan_label}",
            $vlan_defaults)

        create_resources('vlan',
          $vlan_config)
  }

  if(defined('yumrepo')
    and ($yumrepo_enabled
      or $global_enable)) {

        $yumrepo_config =
          hiera_hash("${prefix}${yumrepo_label}",
            $yumrepo_defaults)

        create_resources('yumrepo',
          $yumrepo_config)
  }

  if(defined('zfs')
    and ($zfs_enabled
      or $global_enable)) {

        $zfs_config =
          hiera_hash("${prefix}${zfs_label}",
            $zfs_defaults)

        create_resources('zfs',
          $zfs_config)
  }

  if(defined('zone')
    and ($zone_enabled
      or $global_enable)) {

        $zone_config =
          hiera_hash("${prefix}${zone_label}",
            $zone_defaults)

        create_resources('zone',
          $zone_config)
  }

  if(defined('zpool')
    and ($zpool_enabled
      or $global_enable)) {

        $zpool_config =
          hiera_hash("${prefix}${zpool_label}",
            $zpool_defaults)

        create_resources('zpool',
          $zpool_config)
  }



  class { 'hieratic::firewall':
    global_enable          => $global_enable,
    firewall_label         => "${prefix}${firewall_label}",
    firewall_enabled       => $firewall_enabled,
    firewall_defaults      => $firewall_defaults,
    firewall_pre_label     => "${prefix}${firewall_pre_label}",
    firewall_pre_enabled   => $firewall_pre_enabled,
    firewall_pre_defaults  => $firewall_pre_defaults,
    firewall_post_label    => "${prefix}${firewall_post_label}",
    firewall_post_enabled  => $firewall_post_enabled,
    firewall_post_defaults => $firewall_post_defaults,
  }

}
