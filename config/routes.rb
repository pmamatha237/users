Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
	resources :addresses 
	root 'users#index'
  as :users do
    get 'login', to: 'addresses#index'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end