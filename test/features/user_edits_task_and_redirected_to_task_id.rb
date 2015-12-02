require_relative '../test_helper'

class UserEditsTask < FeatureTest
  def test_task_is_edited
    #When I visit the task index
    TaskManager.create({:title => "1 title",
                        :description => "1 description"})
    visit '/tasks'
    #And I see the tasks
    #And I click the edit link
    click_link("edit")
    #And I get redirected to the edit screen
    #And I enter title
    within("#edit_form") do 
      fill_in('task[title]', :with => "modified title")
    #And I enter description
      fill_in('task[description]', :with => "modified description")
    #And I click submit 
      click_button("edit_button")
      save_and_open_page
      assert page.has_content?("modified title")
    end 
    #I am redirected to task id
    #Then the title and description have been modified
  end
end 