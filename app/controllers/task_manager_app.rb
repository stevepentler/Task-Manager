require 'models/task_manager'

class TaskManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/' do 
    erb :dashboard
  end 

  #read
  get '/tasks' do
    @tasks = TaskManager.all
    erb :index
  end

  #create (first half)
  get '/tasks/new' do
    erb :new
  end 

  #create (second half)
  post '/tasks' do
    TaskManager.create(params[:task])
    redirect '/tasks'
  end

  #read
  get '/tasks/:id' do |id|
    @task = TaskManager.find(id.to_i)
    erb :show
  end 

  not_found do 
    erb :error
  end 

end 