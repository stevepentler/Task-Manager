require_relative '../test_helper'

class UserEditsTask < FeatureTest
    
  def test_task_is_edited
    TaskManager.create({:title       => "a title",
                        :description => "a description"})
    #When I visit the task index
    visit '/tasks'
    #And I see the tasks
    #And I click the edit link
    click_link("edit")
    #And I get redirected to the edit screen
    #And I enter title
    assert_equal '/tasks/1/edit', current_path
    within("#edit_form") do 
      fill_in('task[title]', :with => "modified title")
    #And I enter description
      fill_in('task[description]', :with => "modified description")
    #And I click submit 
      click_button("edit_button")
    #I am redirected to task id
    #Then the title and description have been modified
      assert page.has_content?("modified title")
      assert page.has_content?("modified description")
    end 
  end
end 