##2015-??-?? - Release 0.5.3

### Summary

### Features

* The new `prefix` option adds a string in front of all labels in hiera. This
  allows for overridable namespaces on hieratic.
* This release adds support for twelve modules and has improved documentation.

### New Modules

* [puppetlabs-acl](http://forge.puppetlabs.com/puppetlabs/acl)
* [puppetlabs-apache](http://forge.puppetlabs.com/puppetlabs/apache)
* [puppetlabs-apt](http://forge.puppetlabs.com/puppetlabs/apt)
* [puppetlabs-concat](http://forge.puppetlabs.com/puppetlabs/concat)
* [puppetlabs-git](http://forge.puppetlabs.com/puppetlabs/git)
* [puppetlabs-inifile](http://forge.puppetlabs.com/puppetlabs/inifile)
* [puppetlabs-java_ks](http://forge.puppetlabs.com/puppetlabs/java_ks)
* [puppetlabs-mysql](http://forge.puppetlabs.com/puppetlabs/mysql)
* [puppetlabs-postgresql](http://forge.puppetlabs.com/puppetlabs/postgresql)
* [puppetlabs-registry](http://forge.puppetlabs.com/puppetlabs/registry)
* [puppetlabs-rsync](http://forge.puppetlabs.com/puppetlabs/rsync)
* [puppetlabs-vcsrepo](http://forge.puppetlabs.com/puppetlabs/vcsrepo)



##2015-03-22 - Release 0.5.2

### Summary

This release focuses on code quality improvements and service robustness.

#### Bug Fixed

- Corrected issue where the "class" resources was sometimes marked as undefined.
