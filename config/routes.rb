Rails.application.routes.draw do
  root 'home#index'


  devise_for :users
  get 'home/index'
  get 'home/index'
  match 'home/edit', via: [:get]
  match 'home/update', via: [:post, :patch]

  get 'admin', to: 'admin#index'
  get "admin/:id/edit" => "admin#edit", as: "user_edit"
  get "admin/:id/transactions" => "admin#transactions", as: "user_transactions"
  patch 'admin/:id/update' => 'admin#update', as: 'user_update_by_admin'

  # get 'transactions/deposit'
  resources :transactions


	mount ActionCable.server => '/cable'
end
