# hieratic
## Table of Contents
1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with hieratic](#setup)
  - [What hieratic affects](#what-hieratic-affects)
  - [Setup requirements](#setup-requirements)
  - [Beginning with hieratic](#beginning-with-hieratic)

4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
6. [Limitations - OS compatibility, etc.](#limitations)
7. [Development - Guide for contributing to the module](#development)

## Overview
Hieratic allows Puppet Resources to be created directly in [Hiera](https://docs.puppetlabs.com/hiera/1/).

## Module Description
This incredibly meta module allows for the direct creation of resources using Hiera.

This module does, by itself, add any resources or change your systems. What it does is add a new way to configure systems by defining resources inside of Hiera. This makes it possible to define all site configuration in Hiera.

## Supported Resources
- [Puppet Resource Types](https://docs.puppetlabs.com/references/latest/type.html)
- [Firewall Module](https://forge.puppetlabs.com/puppetlabs/firewall), with the
- addition of "firewall_pre" and "firewall_post" for global defaults around the
- custom rules.

## Setup
### What hieratic affects
- Any supported resource can be modified with this module.
- Most modules can be used by this module through the "class" resource.

### Setup Requirements
It's recommended that you enable ["deeper merge"](https://docs.puppetlabs.com/hiera/1/hierarchy.html) in Hiera and define a proper [hierarchy](https://docs.puppetlabs.com/hiera/1/hierarchy.html).

### Beginning with hieratic
Make sure to include hieratic in your main manifest.

```puppet
include hieratic
```

At this point you can move away manifests and over to Hiera.

## Usage
### Define Resources in Hiera
Install Packages:

```yaml
package:
  git: {}
  subversion: {}
  p7zip: {}
  p7zip-full: {}
  nmap: {}
  ethstatus: {}
  iptraf: {}
```

Setup Groups:

```yaml
group:
  sudo:
    name: 'sudo'
    ensure: 'present'
  admin:
    name: 'admin'
    ensure: 'present'
```

### Add Parameters to Resources in Hiera
You can split configuration between files. For example, if you want to have a base ssh configuration with a secondary

```yaml
- "%{::virtual}"
- "common"
```

common.yaml:

```yaml
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

On systems running Vagrant we want to make sure that vagrant ssh will continue to work. This can be done using the following file when using Vagrant with VirtualBox.

virtualbox.yaml:

```yaml
class:
  'ssh':
    storeconfigs_enabled: false
    server_options:
      Port:
        - 22
      AllowGroups:
        - vagrant
```

### Change the Labels (or names) of Hiera Resources
Each resource type has an associated label parameter that can be used to change how resources are grouped in Hiera. To refer to class resources as "classes" then change the "class_label" to "classes".

```puppet
class { 'hieratic':
  class_label => 'classes',
  package_label => 'packages',  
}
```

```yaml
packages:
  git: {}
  subversion: {}
  p7zip: {}
  p7zip-full: {}
  nmap: {}
  ethstatus: {}
  iptraf: {}
```

### Enabling Some Resources and not Others
By default Hieratic enables all resource types. Turning off "global_enable" lets resources get enabled on an individual basis. They are all disabled by default, and can be turned on by their respective "type_enable" parameters.

To turn off all resources types and enable class and files-

```puppet
class { 'hieratic':
  global_enable => false,
  class_enable => true,
  file_enable => true,
}
```

## Reference
The only public facing class is "hieratic".

### Parameters
- [_global_enable_]

   Defaults to true. With this on all resources are exposed through Hiera.

   For granular control set this to false and manually enable specific resource

   types.

- [_TYPE_enable_]

   Defaults to true. With this on all resources are exposed through Hiera.

- [_TYPE_label_]

   Defaults to the name of the type. This defines the top level hiera variable

   name to use when defining values of this type.

## Limitations
This module works with any version of Puppet that has Hiera installed, on any operating system.

## Development
This module uses a generator to build the code to support all of the resource types. If you're looking to add a new resource type simply open a pull request adding it to [this file](https://github.com/tedivm/puppet-hieratic/blob/master/resources/typelist.txt) and updating the supported modules list.
