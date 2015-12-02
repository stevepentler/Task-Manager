require_relative '../test_helper'

class UserSeesGreetingOnHomepage < FeatureTest  #to inherit include Capybara from FeatureTest
  def test_greeting_is_displayed #happy path
    #As a guest
    #When I visit the homepage
    visit '/'
    #Then I see "task manager"
    # save_and_open_page if you want to see unstyled css page when run test
    within('#greeting') do  #greeting is specific class
      assert page.has_content?("task manager")
    end 
  end 

end 