Brian::Application.routes.draw do
  resources :user
  resources :form

  root 'form#index'

  get 'signup' => 'user#new'
  post 'signup' => 'user#create'

  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'
  # get 'logout' => 'session#destroy'

  get 'privacy' => 'site#privacy'
  get 'terms' => 'site#terms'

  get 'reset/:code' => 'password#edit', as: :reset_password
  put 'reset/:code' => 'password#update'
  patch 'reset/:code' => 'password#update'

  get 'wdi' => 'site#wdi'


end

