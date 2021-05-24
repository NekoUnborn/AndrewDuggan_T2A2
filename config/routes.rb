Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'trades#index'
  resources :roles, :users, :trades, :jobs, :profiles, :addresses
  resources :users, only: %i[show edit update]

  delete 'roles/removerolefromuser/:role_id/:user_id', to: "roles#remove_role_from_user", as: "remove_role_from_user"

  # get 'roles', to: 'roles#index', as: 'roles'
  # post 'roles', to: 'roles#create'
  # get 'roles/new', to: 'roles#new', as: 'new_role'
  # get 'roles/:id', to: 'roles#show', as: 'role'
  # get 'roles/:id/edit', to: 'roles#edit', as: 'edit_role'
  # put 'roles/:id', to: 'roles#update'
  # patch 'roles/:id', to: 'roles#update'
  # delete 'roles/:id', to: 'roles#destroy'

  #  get 'trades', to: 'trades#index', as: 'trades'
  #  post 'trades', to: 'trades#create'
  #  get 'trades/new', to: 'trades#new', as: 'new_trade'
  #  get 'trades/:id', to: 'trades#show', as: 'trade'
  #  get 'trades/:id/edit', to: 'trades#edit', as: 'edit_trade'
  #  put 'trades/:id', to: 'trades#update'
  #  patch 'trades/:id', to: 'trades#update'
  #  delete 'trades/:id', to: 'trades#destroy'

  #  get 'roles', to: 'roles#index', as: 'roles'
  #  post 'roles', to: 'roles#create'
  #  get 'roles/new', to: 'roles#new', as: 'new_role'
  #  get 'roles/:id', to: 'roles#show', as: 'role'
  #  get 'roles/:id/edit', to: 'roles#edit', as: 'edit_role'
  #  put 'roles/:id', to: 'roles#update'
  #  patch 'roles/:id', to: 'roles#update'
  #  delete 'roles/:id', to: 'roles#destroy'

  #  get 'profiles', to: 'profiles#index', as: 'profiles'
  #  post 'profiles', to: 'profiles#create'
  #  get 'profiles/new', to: 'profiles#new', as: 'new_profile'
  #  get 'profiles/:id', to: 'profiles#show', as: 'profile'
  #  get 'profiles/:id/edit', to: 'profiles#edit', as: 'edit_profile'
  #  put 'profiles/:id', to: 'profiles#update'
  #  patch 'profiles/:id', to: 'profiles#update'
  #  delete 'profiles/:id', to: 'profiles#destroy'

  #  get 'users', to: 'users#index', as: 'users'
  #  post 'users', to: 'users#create'
  #  get 'users/new', to: 'users#new', as: 'new_user'
  #  get 'users/:id', to: 'users#show', as: 'user'
  #  get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  #  put 'users/:id', to: 'users#update'
  #  patch 'users/:id', to: 'users#update'
  #  delete 'users/:id', to: 'users#destroy'

  #  get 'addresses', to: 'addresses#index', as: 'addresses'
  #  post 'addresses', to: 'addresses#create'
  #  get 'addresses/new', to: 'addresses#new', as: 'new_address'
  #  get 'addresses/:id', to: 'addresses#show', as: 'address'
  #  get 'addresses/:id/edit', to: 'addresses#edit', as: 'edit_address'
  #  put 'addresses/:id', to: 'addresses#update'
  #  patch 'addresses/:id', to: 'addresses#update'
  #  delete 'addresses/:id', to: 'addresses#destroy'

  #  get 'jobs', to: 'jobs#index', as: 'jobs'
  #  post 'jobs', to: 'jobs#create'
  #  get 'jobs/new', to: 'jobs#new', as: 'new_job'
  #  get 'jobs/:id', to: 'jobs#show', as: 'job'
  #  get 'jobs/:id/edit', to: 'jobs#edit', as: 'edit_job'
  #  put 'jobs/:id', to: 'jobs#update'
  #  patch 'jobs/:id', to: 'jobs#update'
  #  delete 'jobs/:id', to: 'jobs#destroy'

  get 'dashboards', to: 'dashboards#index', as: 'dashboards'
  post 'dashboards', to: 'dashboards#create'
  get 'dashboards/new', to: 'dashboards#new', as: 'new_dashboard'
  get 'dashboards/:id', to: 'dashboards#show', as: 'dashboard'
  get 'dashboards/:id/edit', to: 'dashboards#edit', as: 'edit_dashboard'
  put 'dashboards/:id', to: 'dashboards#update'
  patch 'dashboards/:id', to: 'dashboards#update'
  delete 'dashboards/:id', to: 'dashboards#destroy'
end
