require_relative '../test_helper'

class TaskManagerTest < Minitest::Test 

  # def create_tasks(num)   #Way of creating data
  #   num.times do |n|
  #     TaskManager.create({:title => "a title#{n+1}", :description => "a description#{n+1}"})
  #   end
  # end 

  # def test_finds_task_using_create_tasks
  #   create_tasks(5)
  #   assert_equal 5, TaskManager.all.count
  # end 

  def test_task_can_be_created
    TaskManager.create({title: "Call Mom!",
                        description: "psyche!"})
    task = TaskManager.find(1)
    assert_equal "Call Mom!", task.title
    assert_equal "psyche!", task.description
    assert_equal 1, task.id
  end 

  def test_finds_task_in_list
    TaskManager.create({title: "Call Mom!",
                        description: "psyche!"})
    TaskManager.create({title: "Call Dad!",
                        description: "NOT!"})
    TaskManager.create({title: "Call STEVE O!",
                        description: "STEVE!!!!!!!"})
    task1 = TaskManager.find(1)
    assert_equal "Call Mom!", task1.title
    assert_equal "psyche!", task1.description
    assert_equal 1, task1.id
    task2 = TaskManager.find(2)
    assert_equal "Call Dad!", task2.title
    assert_equal "NOT!", task2.description
    assert_equal 2, task2.id
    task3 = TaskManager.find(3)
    assert_equal "Call STEVE O!", task3.title
    assert_equal "STEVE!!!!!!!", task3.description
    assert_equal 3, task3.id
  end 


  def test_update_existing_task
    TaskManager.create({title: "Call Mom!",
                        description: "psyche!"})
    TaskManager.update( 1, 
                        {title: "Do Nothing!",
                        description: "LOLZ!"})
    task = TaskManager.find(1)
    assert_equal "Do Nothing!", task.title
    assert_equal "LOLZ!", task.description
    assert_equal 1, task.id
  end 

  def test_delete_existing_task
    TaskManager.create({title: "Call Mom!",
                        description: "psyche!"})
    TaskManager.create({title: "Call Dad!",
                        description: "NOT!"})
    assert_equal 2, TaskManager.all.count
    
    TaskManager.delete(1)
    assert_equal 1, TaskManager.all.count
    
    task_last = TaskManager.all.last
    assert_equal 2, task_last.id

    task_first = TaskManager.all.first 
    assert_equal 2, task_first.id
  end 

end 