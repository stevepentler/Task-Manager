ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'


class Minitest::Test 
  def teardown    #setup then run test then teardown to delete everything before moving to next test
    TaskManager.delete_all #will use a database cleaner when using real databases other than YAML
  end
end

Capybara.app = TaskManagerApp #set to classname of app

class FeatureTest < Minitest::Test #inherits methods from Capybara domain specific language
  include Capybara::DSL
end 