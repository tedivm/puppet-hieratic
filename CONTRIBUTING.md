# Contributions Welcome!

Pull Requests and Community Contributions are the bread and butter of open
source software. Every contribution- from bug reports to feature requests, typos
to full new features- are greatly appreciated.


## Important Guidelines

* One Item Per Pull Request or Issue. This makes it much easier to review code
  and merge it back in, and prevents issues with one request from blocking
  another.

* Read the LICENSE document and make sure you understand it, because your code
  is going to be released under it.

* Be prepared to make revisions. Don't be discouraged if you're asked to make
  changes, as that is just another step towards refining the code and getting it
  merged back in.

* Remember to add the relevant documentation, both inline and in the README.


## Code Styling

This project follows the PSR standards set forth by
[The Puppet Language Style Guide](https://docs.puppetlabs.com/guides/style_guide.html).

All code most follow these standards to be accepted. The easiest way to confirm
this is to run `puppet-lind` once the new changes are finished.

    gem install puppet-lint
    puppet-lint --fix ./


## Getting Started Developing Hieratics

### Working with generate.py

This module uses a generator to build the code to support all of the resource
types. This is due to the large amount of duplicated code that exists to support
each resource type.

The generate.py script uses templates, which are located in the resource
directory. These templates control the formatting of parameters, docblock, and
the create_resources blocks. To make changes to how all of the resources are
generated simply edit these templates and rerun the generator.

### Adding New Resource Types

If you're only looking to add new resources then the process is simple. Just
open a new Pull Request that adds that resource to [this file](https://github.com/tedivm/puppet-hieratic/blob/master/resources/typelist.txt)
and updates the [supported resources list]((#supported-resources)).

For resources that require customization (such as the firewall module) you
should add the code into a separate class and then include it in the
[generator](https://github.com/tedivm/puppet-hieratic/blob/master/src/generate.py#L48).

