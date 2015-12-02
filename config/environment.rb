require 'bundler' #gem that controls gems
Bundler.require   #requires all gems 

# get the path of the root of the app
APP_ROOT = File.expand_path("..", __dir__)     #expand path does everything up to this point, dir is current directory(config.ru), want task manager so include ".."
#sets

# require all the controller(s) instead of having to list each one
Dir.glob(File.join(APP_ROOT, 'app', 'controllers', '*.rb')).each { |file| require file }  
#Dir.glob produces an array of all files
#File.join joins everything together with a slash mark
#.each takes each file and requires it 

# require the model(s)
Dir.glob(File.join(APP_ROOT, 'app', 'models', '*.rb')).each { |file| require file }
#{APP_ROOT}/app/modes/*.rb

# configure TaskManagerApp settings
class TaskManagerApp < Sinatra::Base
  set :method_override, true           #allows put and delete using forms with hidden method override
  set :root, APP_ROOT                  #set the root to APP_ROOT from above
  set :views, File.join(APP_ROOT, "app", "views")   #instead of looking in default(views folder at same level as controller), find views in the other folder
  set :public_folder, File.join(APP_ROOT, "app", "public")  #instead of looking in default, look in public
end