Newapp::Application.routes.draw do

  get '/information', :controller => 'people', :action => 'all'
  post '/information', :controller => 'people', :action => 'create'
  get '/information/new', :controller => 'people', :action => 'add_info'
end
