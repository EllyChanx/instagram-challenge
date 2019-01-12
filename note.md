Rspec Testing:

put following under :d :t in gemfile

  gem 'rspec-rails', '~> 3.5'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'rails-controller-testing' # If you are using Rails 5.x

run: bundle

run: rails generate rspec:install

put following in .rspec

--color
--require spec_helper

put following in rials_helper

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # Choose a test framework:
    with.test_framework :rspec

    # Choose one or more libraries:
    with.library :active_record
    with.library :active_model
    with.library :action_controller
    # Or, choose all of the above:
    with.library :rails
  end
end

RSpec.configure do |config|
  [:controller, :view, :request].each do |type|
    config.include ::Rails::Controller::Testing::TestProcess, :type => type
    config.include ::Rails::Controller::Testing::TemplateAssertions, :type => type
    config.include ::Rails::Controller::Testing::Integration, :type => type
  end
end

put following in the spec_helper (top)

require 'simplecov'
require 'simplecov-console'
SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
SimpleCov.start 'rails'
SimpleCov.add_filter ['app/channels', 'app/jobs', 'app/mailers' ]
# exclude these files for coverage

require 'capybara/rspec'

Add tests and run rspec to get coverage report


