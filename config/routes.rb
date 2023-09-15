Rails.application.routes.draw do

  root 'web#index';
  resources :users, except: [:edit, :new]
  resources :books, except: [:edit, :new]

  post '/loans', to: 'loans#create'
  get '/loans', to: 'loans#index'
  get '/loans/:id', to: 'loans#show', as: :loan
  patch '/loans/:id/return', to: 'loans#return'

end