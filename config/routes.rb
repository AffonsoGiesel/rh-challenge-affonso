Rails.application.routes.draw do
  resources :job_roles
  resources :workspaces
  resources :funcionarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/inicio', to: 'funcionarios#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "funcionarios#index"
end
