Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/user/list', to: 'users#list'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
