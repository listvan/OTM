Otm::Application.routes.draw do
  get '/tasks' => 'tasks#index', :as => :tasks
  get '/tasks/:id' => 'tasks#show', :as => :task
  post '/tasks' => 'tasks#create'
  
  get '/tasks/:id/edit'  => 'tasks#edit', :as => 'edit_task'
  put '/tasks/:id'      => 'tasks#update'
  
  delete '/tasks/:id'   => 'tasks#destroy'
  
  
  match '/tasks/:id/child', :to => 'tasks#delete_child', :as =>'delete_child'

  get '/tasks/:id/dependencies' => 'dependencies#index', :as => :dependencies
  match '/tasks/:id/dependencies', :to => 'dependencies#create'
  
  match '/tasks/:id/dependencies/:id', :to => 'dependencies#destroy', :as => 'delete_dependency'

  match '/tasks/:id/processes', :controller => 'Task::Process', :action => :create, :as => 'task_processes'

  root :to => "tasks#index"
end
