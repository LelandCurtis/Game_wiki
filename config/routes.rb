Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/levels', to: 'levels#index'
  get '/levels/:id', to: 'levels#show'
  get '/monsters', to: 'monsters#index'
  get '/monsters/:id', to: 'monsters#show'
  get '/roles', to: 'roles#index'
  get '/roles/new', to: 'roles#new'
  get '/roles/:id', to: 'roles#show'
  post '/roles', to: 'roles#create'
  get '/roles/:role_id/edit', to: 'roles#edit'
  patch '/roles/:role_id', to: 'roles#update'
  get '/weapons', to: 'weapons#index'
  get '/weapons/:id', to: 'weapons#show'
  get '/roles/:role_id/weapons', to: 'role_weapons#index'
  get '/roles/:role_id/weapons/new', to: 'role_weapons#new'
  get '/levels/:level_id/monsters', to: 'level_monsters#index'
end
