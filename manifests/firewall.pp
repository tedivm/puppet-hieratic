class hieratic::firewall (
  $global_enable = true,
  $firewall_label = firewall,
  $firewall_enabled = false,
  $firewall_pre_label = firewall_pre,
  $firewall_pre_enabled = false,
  $firewall_post_label = firewall_post,
  $firewall_post_enabled = false,
) {

  if(defined('firewall') and ($firewall_enabled or $global_enable)) {
    $firewall_config = hiera_hash($firewall_label, {})
    create_resources(firewall, $firewall_config)

    resources { "firewall":
      purge => true
    }

    Firewall {
      before  => Class['fw::post'],
      require => Class['fw::pre'],
    }

    class fw::pre {
      Firewall {
        require => undef,
      }
      if(defined('firewall') and ($firewall_pre_enabled or $global_enable)) {
        create_resources(firewall, hiera_hash($firewall_pre_label, {}))
      }
    }

    class fw::post {
      Firewall {
        before => undef,
      }
      if(defined('firewall') and ($firewall_post_enabled or $global_enable)) {
        create_resources(firewall, hiera_hash($firewall_post_label, {}))
      }
    }

    class { ['fw::pre', 'fw::post']: }
  }
}
