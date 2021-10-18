# This gemfile provides additional gems for testing and releasing this cookbook
# It is meant to be installed on top of ChefDK which provides the majority
# of the necessary gems for testing this cookbook
#
# Run 'chef exec bundle install' to install these dependencies

source 'https://rubygems.org'

gem 'berkshelf'
gem 'rb-readline'
gem 'stove'

group :development do
  gem 'diplomat'
  gem 'github_changelog_generator', require: false
  gem 'webmock', '~> 3.1'
  gem 'chefspec', '7.2.1'
  gem 'rubocop', '~> 0.62.0'
end
