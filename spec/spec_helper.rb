require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require_relative '../bookmarks_app.rb' # Or whatever your controller file is called
#require 'test_db_setup'
require 'rake'

ENV['RACK_ENV'] = 'testing'

Capybara.app = Bookmarks # Or whatever you named the class you created in your controller file

Rake.application.load_rakefile

RSpec.configure do |config|
  config.before(:each) do
    Rake::Task['test_database_setup'].invoke
  end
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
