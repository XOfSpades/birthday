Rails.application.routes.draw do
  post 'person/create', to: 'person#create'
  put 'person/:id', to: 'person#update'
  delete 'person/:id', to: 'person#destroy'
  get 'person/:id', to: 'person#show'
  get 'person', to: 'person#index'
  get 'person/new', to: 'person#new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
