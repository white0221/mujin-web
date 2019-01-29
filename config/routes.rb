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

  get '/stock', to: 'stocks#read'
  get '/stock/list', to: 'stocks#list'
  get '/stock/update', to: 'stocks#update'
  post '/stock', to: 'stocks#create'
  patch '/stock', to: 'stocks#upgrade_for_api'
  patch '/stock/upgrade', to: 'stocks#upgrade'

  get '/item', to: 'items#read'
  post '/item', to: 'items#create'
  get '/item/list', to: 'items#list'
  get '/item/add', to: 'items#new'
  post '/item/add', to: 'items#add'
  get '/item/update', to: 'items#update'
  get '/item/delete', to: 'items#delete'
  patch '/item/update', to: 'items#upgrade'
  delete '/item/delete', to: 'items#destroy'

  get '/history', to: 'histories#read'
  get '/history/list', to: 'histories#list'
  post '/history', to: 'histories#create'

  get '/history_detail', to: 'history_details#read'
  get '/history_detail/list', to: 'history_details#list'
  post '/history_detail', to: 'history_details#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	get '/tablet/user/list', to: 'users#tablet'

  root to: '/item/list', to: 'items#list'
end
