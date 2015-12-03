require_relative "../test_helper"

class UserDeletesTask < FeatureTest
    
  def test_task_is_deleted
    TaskManager.create({title: "Call Mom!",
                        description: "psyche!"})
    #When I visit the task index
    visit '/tasks'

    #And I locate the task I want to delete
    assert page.has_content?("Call Mom!")
    
    #And I click the delete button
    click_button("delete")
    
    refute page.has_content?("Call Mom!")
    refute page.has_content?("psyche!")
    assert '/tasks', current_path
  end 

end 