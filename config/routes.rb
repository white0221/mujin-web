Rails.application.routes.draw do
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signin', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/user/list', to: 'users#list'
  get '/user/update', to: 'users#update'
  get '/user/delete', to: 'users#delete'
  patch '/user/update', to: 'users#upgrade'
  delete '/user/delete', to: 'users#destroy'

  get '/item', to: 'items#read'
  post '/item', to: 'items#create'
  get '/item/list', to: 'items#list'
  get '/item/update', to: 'items#update'
  get '/item/delete', to: 'items#delete'
  patch '/item/update', to: 'items#upgrade'
  delete '/item/delete', to: 'items#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
