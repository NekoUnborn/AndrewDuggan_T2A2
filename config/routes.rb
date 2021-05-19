Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :roles, :users

  # get 'roles', to: 'roles#index', as: 'roles'
  # post 'roles', to: 'roles#create'
  # get 'roles/new', to: 'roles#new', as: 'new_role'
  # get 'roles/:id', to: 'roles#show', as: 'role'
  # get 'roles/:id/edit', to: 'roles#edit', as: 'edit_role'
  # put 'roles/:id', to: 'roles#update'
  # patch 'roles/:id', to: 'roles#update'
  # delete 'roles/:id', to: 'roles#destroy'
end
