Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations" }
  root to: "home#index"
  resources :user do
    resources :party, only: [:index]
  end
  resources :party, except: [:index]
  post 'guest', to: 'guest#create'
  put 'wish_list_item/:id', to: 'wish_list_item#reserve'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
