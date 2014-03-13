Brian::Application.routes.draw do

  root 'site#index' #step 1 where browser -> server

  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'
  get 'logout' => 'session#destroy'

  get 'privacy' => 'site#privacy'
  get 'terms' => 'site#terms'

end

# the concept of MVC
