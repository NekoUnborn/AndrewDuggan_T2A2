Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'dashboards#index'

  get 'profiles/selectrole/', to: 'profiles#select_role', as: 'select_role'
  post 'profiles/assignrole/', to: 'profiles#assign_role', as: 'add_role'
  delete 'roles/removerolefromuser/:role_id/:user_id', to: 'roles#remove_role_from_user', as: 'remove_role_from_user'

  resources :roles, :users, :trades, :jobs, :profiles, :dashboards
  resources :users, only: %i[show edit update]

end
