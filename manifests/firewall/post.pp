class hieratic::firewall::post {
  Firewall {
    before => undef,
  }
  if(defined('firewall') and ($hieratic::firewall::firewall_post_enabled or $hieratic::firewall::global_enable)) {
    create_resources(firewall, hiera_hash($hieratic::firewall::firewall_post_label, {}))
  }
}
