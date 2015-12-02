class TaskManagerApp < Sinatra::Base

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

  get '/tasks/:id/edit' do |id|  #or params[:id] in block, #id isn't specific to symbol, if multiple go in order
    @task = TaskManager.find(id.to_i)
    erb :edit
  end 

  put '/tasks/:id' do |id|
    TaskManager.update(id.to_i, params[:task]) 
    redirect "/tasks/#{id}"
  end 

  delete '/tasks/:id' do |id|
    TaskManager.delete(id.to_i)
    redirect '/tasks'
  end 

  not_found do 
    erb :error
  end 

end 