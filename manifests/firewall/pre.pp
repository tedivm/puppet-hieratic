# == Class: hieratic
#
# Internal class- this should be called through Hieratic, not directly.
#
# === Authors
#
# Robert Hafner <tedivm@tedivm.com>
#
# === Copyright
#
# Copyright 2015 Robert Hafner
#

class hieratic::firewall::pre {
  Firewall {
    require => undef,
  }
  if(defined('firewall')
    and ($hieratic::firewall::firewall_pre_enabled
      or $hieratic::firewall::global_enable)) {
    create_resources(firewall,
      hiera_hash($hieratic::firewall::firewall_pre_label,
        $hieratic::firewall::firewall_pre_defaults))
  }
}
