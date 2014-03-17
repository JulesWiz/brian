Brian::Application.routes.draw do
  resources :user

  root 'site#index'

  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'
  # get 'logout' => 'session#destroy'
  get 'form' => 'session#form'
  post 'form' => 'session#formcreate'

  get 'privacy' => 'site#privacy'
  get 'terms' => 'site#terms'

  get 'reset/:code' => 'password#edit', as: :reset
  put 'reset/:code' => 'password#update'
  patch 'reset/:code' => 'password#update'

  get 'wdi' => 'site#wdi'

end

