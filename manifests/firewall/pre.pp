class hieratic::firewall::pre {
  Firewall {
    require => undef,
  }
  if(defined('firewall') and ($hieratic::firewall::firewall_pre_enabled or $hieratic::firewall::global_enable)) {
    create_resources(firewall, hiera_hash($hieratic::firewall::firewall_pre_label, {}))
  }
}
