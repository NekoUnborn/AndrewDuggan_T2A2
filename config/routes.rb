Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'dashboards#index'
  resources :roles, :users, :trades, :jobs, :profiles, :dashboards
  resources :users, only: %i[show edit update]

  delete 'roles/removerolefromuser/:role_id/:user_id', to: "roles#remove_role_from_user", as: "remove_role_from_user"
  patch 'roles/addroletouser/:role_id/:user_id', to: "roles#radd_role_to_user", as: "add_role_to_user"
end
