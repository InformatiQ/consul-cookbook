name 'consul'
maintainer 'John Bellone'
maintainer_email 'jbellone@bloomberg.net'
license 'Apache-2.0'
description 'Application cookbook which installs and configures Consul.'
long_description 'Application cookbook which installs and configures Consul.'
version '4.2.5'

recipe 'consul::default', 'Installs and configures the Consul service.'
recipe 'consul::client_gem', 'Installs the Consul Ruby client as a gem.'

supports 'centos', '>= 6.4'
supports 'redhat', '>= 6.4'
supports 'ubuntu', '>= 12.04'
supports 'solaris2'
supports 'arch'
supports 'windows'

depends 'nssm', '>= 3.42.0'

source_url 'https://github.com/johnbellone/consul-cookbook' if respond_to?(:source_url)
issues_url 'https://github.com/johnbellone/consul-cookbook/issues' if respond_to?(:issues_url)

chef_version '>= 12.1' if respond_to?(:chef_version)
