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
  gem 'rubocop', '~> 0.55.0'
end
