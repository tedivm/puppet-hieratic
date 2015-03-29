# hieratic

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
2. [Supported Resources - What resources are supported by this module](#supported-resources)
3. [Setup - The basics of getting started with hieratic](#setup)
    * [What hieratic affects](#what-hieratic-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with hieratic](#beginning-with-hieratic)
4. [Usage - Configuration options and additional functionality](#usage)
    * [Define Resources in Hiera](#define-resources-in-hiera)
    * [Using Hierarchies with Hiera and Hieratic](#using-hierarchies-with-hiera-and-hieratic)
    * [Differences Between Hieratic and Automatic Parameter Lookup](#differences-between-hieratic-and-automatic-parameter-lookup)
    * [Automatic Parameter Lookup Compatibility](#automatic-parameter-lookup-compatibility)
    * [Change the Labels (or names) of Hiera Resources](#change-the-labels-or-names-of-hiera-resources)
    * [Setting Default Values for Resources](#setting-default-values-for-resources)
    * [Enabling Some Resources and not Others](#enabling-some-resources-and-not-others)
    * [Defining Firewall Rules](#defining_firewall_rules)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
    * [Parameters](#parameters)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Hieratic allows Puppet Resources to be created directly in
[Hiera](https://docs.puppetlabs.com/hiera/1/).

## Module Description

This incredibly meta module allows for the direct creation of resources using
Hiera.

This module does not, by itself, add any resources or change your systems. What
it does is add a new way to configure systems by defining resources inside of
Hiera. This makes it possible to define all site configuration in Hiera. This
means that all of the site data can be kept in Hiera, allowing both a separation
of data and implementation as well as the ability to store all configurations in
a consistant format (yaml, json, or a custom provider).

## Supported Resources

* [Puppet Resource Types](https://docs.puppetlabs.com/references/latest/type.html)
* [Puppet Classes](https://docs.puppetlabs.com/puppet/latest/reference/lang_classes.html)

In addition to the build in resources, Hieratic supports the resource types from
these modules:

* [puppetlabs-acl](http://forge.puppetlabs.com/puppetlabs/acl)
* [puppetlabs-apache](http://forge.puppetlabs.com/puppetlabs/apache)
* [puppetlabs-apt](http://forge.puppetlabs.com/puppetlabs/apt)
* [puppetlabs-concat](http://forge.puppetlabs.com/puppetlabs/concat)
* [puppetlabs-firewall](https://forge.puppetlabs.com/puppetlabs/firewall), with
  the addition of `firewall_pre` and `firewall_post` for global defaults around
  the custom rules.
* [puppetlabs-git](http://forge.puppetlabs.com/puppetlabs/git)
* [puppetlabs-inifile](http://forge.puppetlabs.com/puppetlabs/inifile)
* [puppetlabs-java_ks](http://forge.puppetlabs.com/puppetlabs/java_ks)
* [puppetlabs-mysql](http://forge.puppetlabs.com/puppetlabs/mysql)
* [puppetlabs-postgresql](http://forge.puppetlabs.com/puppetlabs/postgresql)
* [puppetlabs-registry](http://forge.puppetlabs.com/puppetlabs/registry)
* [puppetlabs-rsync](http://forge.puppetlabs.com/puppetlabs/rsync)
* [puppetlabs-stdlib](http://forge.puppetlabs.com/puppetlabs/stdlib)
* [puppetlabs-vcsrepo](http://forge.puppetlabs.com/puppetlabs/vcsrepo)


## Setup

### What hieratic affects

* Any supported resource can be modified with this module.
* Most modules can be used by this module through the `class` resource.

### Setup Requirements

It's recommended that you enable [`deeper merge`](https://docs.puppetlabs.com/hiera/1/hierarchy.html)
in Hiera and define a proper [hierarchy](https://docs.puppetlabs.com/hiera/1/hierarchy.html).

Although Hiera supports some non-native modules, such as Firewalls, it does not
include them. Any modules that are used as part of a site should be added as
dependencies of that site.

### Beginning with hieratic

Make sure to include `hieratic` in your main manifest.

```puppet
include hieratic
```

At this point you can move away manifests and over to Hiera.

If you want to add custom options you can include Hieratic as a class.

```puppet
class {'hieratic':}
```

## Usage

### Define Resources in Hiera

Without this module packages have to be defined in manifests-
```puppet
$packages = [ "git", "subversion", "p7zip", "nmap", "ethstatus", "iptraf" ]
package { $packages: ensure => "installed" }
```

With Hieratic packages are listed as data in Hiera-
```yaml
---
package:
  git: {}
  subversion: {}
  p7zip: {}
  nmap: {}
  ethstatus: {}
  iptraf: {}
```

This also works for other types such as groups-
```puppet
Group { "sudo":
  name => "sudo"
  ensure => "present"
}

Group { "admin":
  name => "admin"
  ensure => "present"
}
```

The above gets replaced by-
```yaml
---
group:
  sudo:
    name: 'sudo'
    ensure: 'present'
  admin:
    name: 'admin'
    ensure: 'present'
```

### Using Hierarchies with Hiera and Hieratic

> Hiera uses an [ordered hierarchy](https://docs.puppetlabs.com/hiera/1/hierarchy.html)
> to look up data. This allows you to have a large amount of common data and
> override smaller amounts of it wherever necessary.

The beauty of Hiera is in how it allows for default behaviors while allowing
small changes for machines that need it. For example, if you want to have a base
ssh configuration with some additional options for running on VirtualBox with
Vagrant.

For this example make sure your `hiera.yaml` file has a hierarchy using the
`virtual` fact-
```yaml
---
- "%{::virtual}"
- "common"
```

Then define the general definition in a `common.yaml` file:
```yaml
---
class:
 'ssh':
    'server_options':
      Protocol: '2'
      PermitRootLogin: 'no'
      PubkeyAuthentication: 'yes'
      PasswordAuthentication: 'no'
      UsePAM: 'no'
      Port:
        - 5022
      AllowGroups:
        - admin
```

Finally add the custom information to `virtualbox.yaml`:

```yaml
---
class:
  'ssh':
    storeconfigs_enabled: false
    server_options:
      Port:
        - 22
      AllowGroups:
        - vagrant
```

### Differences Between Hieratic and Automatic Parameter Lookup

Hieratic allows for the full merging of hierarchies, which is what allows the
behavior from the example above to take place. The Automatic Parameter Lookup
system has a [severe limitation](https://docs.puppetlabs.com/hiera/1/puppet.html#limitations)
in that it can not merge values from multiple hierarchy levels- you will only
get the highest priority value and nothing else.


### Automatic Parameter Lookup Compatibility

When using Hieratic there is no reason to use APL, and it can in the default
configuration cause some potential issues.

If APL is a requirement then use the `prefix` option in `hieratic` to namespace
the hieratic objects. This will prevent any overlap in names between APL and
Hieratic keys.

```puppet
class { 'hieratic':
  prefix => 'hieratic_',
}
```

Alternatively APL can be disabled in the puppet master's `puppet.conf` file.

```ini
[master]
data_binding_terminus = none
```


### Change the Labels (or names) of Hiera Resources

Each resource type has an associated label parameter that can be used to change
how resources are grouped in Hiera. To refer to class resources as "classes"
then change the "class_label" to "classes".

```puppet
class { 'hieratic':
  class_label => 'classes',
  package_label => 'packages',  
}
```

```yaml
---
packages:
  git: {}
  subversion: {}
  p7zip: {}
  p7zip-full: {}
  nmap: {}
  ethstatus: {}
  iptraf: {}
```


### Setting Default Values for Resources

Hieratic allows you to override the default values of any resource on a global
level.

To set a default shell for all hieratic created users.-
```puppet
class { 'hieratic':
  user_defaults => {
    'shell' => '/bin/zsh'
  },
}
```



### Enabling Some Resources and Not Others

By default Hieratic enables all resource types. Turning off "global_enable" lets
resources get enabled on an individual basis. They are all disabled by default,
and can be turned on by their respective "type_enable" parameters.

To turn off all resources types and enable class and files-
```puppet
class { 'hieratic':
  global_enable => false,
  class_enable => true,
  file_enable => true,
}
```

### Defining Firewall Rules

With Hieratics all of your `firewall` rules can easily be defined in your Hiera
configuration. You can use the `firewall_pre` and `firewall_post` rules to
enforce the order which rules are added by Puppet to the system to prevent
accidental lockouts.

```yaml
---
firewall_pre:
  '000 accept all icmp':
    proto: 'icmp'
    action: 'accept'
  '001 accept all to lo interface':
    proto: 'all'
    iniface: 'lo'
    action: 'accept'
  '002 accept established related rules':
    proto: 'all'
    state:
      - 'ESTABLISHED'
      - 'RELATED'
    action: 'accept'

firewall:
  '022 accept ssh traffic':
    proto: 'tcp'
    dport: '22'
    action: 'accept'

firewall_post:
  '910 drop remaining inputs':
    chain: 'INPUT'
    action: 'drop'
    proto: 'all'
  '910 drop remaining inputs ipv6':
    chain: 'INPUT'
    action: 'drop'
    proto: 'all'
    provider: 'ip6tables'
  '910 drop remaining forwards':
    chain: 'FORWARD'
    action: 'drop'
    proto: 'all'
  '910 drop remaining forwards ipv6':
    chain: 'FORWARD'
    action: 'drop'
    proto: 'all'
    provider: 'ip6tables'
```

## Reference

The only public facing class is "hieratic".

### Parameters

* [*global_enable*]
    Defaults to true. With this on all resources are exposed through Hiera.
    For granular control set this to false and manually enable specific resource
    types.

* [*prefix*]
    Defaults to ''. This string gets added to all of the various `TYPE_label`
    keys in hiera.

* [*TYPE_enable*]
    Defaults to true. With this on all resources are exposed through Hiera.

* [*TYPE_label*]
    Defaults to the name of the type. This defines the top level hiera variable
    name to use when defining values of this type.

* [*TYPE_defaults*]
    Defaults to and empty array. This allows default values to be set for each
    resource type.


## Limitations

This module works with any version of Puppet that has Hiera installed, on any
operating system.

## Development

Contributions are always welcome. Please read the [Contributing Guide](CONTRIBUTING.md)
to get started.
