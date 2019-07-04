# This gemfile provides additional gems for testing and releasing this cookbook
# It is meant to be installed on top of ChefDK which provides the majority
# of the necessary gems for testing this cookbook
#
# Run 'chef exec bundle install' to install these dependencies

source 'https://rubygems.org'

gem 'berkshelf'
gem 'poise', '~> 2.2'
gem 'poise-boiler'
gem 'poise-service', '~> 1.0'
gem 'rb-readline'
gem 'stove'

group :development do
  gem 'diplomat'
  gem 'github_changelog_generator', require: false
  gem 'webmock', '~> 3.1'
  gem 'chefspec', '7.2.1'
  gem 'kitchen-ec2', git: 'https://github.com/criteo-forks/kitchen-ec2.git', branch: 'criteo'
  gem 'dotenv'
end

group :ec2 do
  gem 'chef-dk', git: 'https://github.com/criteo-forks/chef-dk.git', branch: 'strict_update_backport'
  gem 'kitchen-transport-speedy'
  gem 'test-kitchen'
  gem 'winrm',       '>= 1.6'
  gem 'winrm-fs',    '>= 0.3'
end
