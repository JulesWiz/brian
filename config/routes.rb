Brian::Application.routes.draw do
  resources :user
  resources :form

  root 'form#index'

  get 'signup' => 'user#new'
  post 'signup' => 'user#create'

  get 'login' => 'session#new', as: :login_form
  post 'login' => 'session#create', as: :log_in
  delete 'logout' => 'session#destroy'
  # get 'logout' => 'session#destroy'

  get 'privacy' => 'site#privacy'
  get 'terms' => 'site#terms'

  get 'reset/:code' => 'password#edit', as: :reset_password
  put 'reset/:code' => 'password#update'
  patch 'reset/:code' => 'password#update'

  get 'wdi' => 'site#wdi'


end

