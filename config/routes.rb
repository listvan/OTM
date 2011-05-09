Otm::Application.routes.draw do
  get '/tasks' => 'tasks#index', :as => :tasks
  get '/tasks/:id' => 'tasks#show', :as => :task
  post '/tasks' => 'tasks#create'
end
