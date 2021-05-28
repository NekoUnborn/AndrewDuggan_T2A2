Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'dashboards#index'
  resources :roles, :users, :trades, :jobs, :profiles, :dashboards
  resources :users, only: %i[show edit update]

  get 'profiles/selectrole/:user_id', to: 'profiles#select_role', as: 'select_role'
  patch 'profiles/selectrole/:user_id/role_id', to: 'profiles#add_role', as: "add_role"
  delete 'roles/removerolefromuser/:user_id/:role_id', to: "roles#remove_role_from_user", as: "remove_role_from_user"
end
