source "https://rubygems.org"

# Declare your gem's dependencies in leaf_farm.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec


gem 'farm_tools', :git => 'https://github.com/jessethebuilder/farm_tools'
# gem 'farm_tools', :path => 'C:\Users\jf\Desktop\jesseweb\farm_tools'
gem 'rails', '4.2'

group :test do
  gem 'capybara'
  #gem 'guard-rspec'
  #gem 'selenium-webdriver'
  gem 'shoulda'
  #gem 'launchy', '~> 2.3.0'
  gem 'factory_girl_rails'
  gem 'database_cleaner', '~> 1.0.0rc'

end

group :test, :development do
  gem 'faker'
end

 #todo
# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'
