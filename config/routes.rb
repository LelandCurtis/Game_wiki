Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/levels', to: 'levels#index'
  get '/levels/new', to: 'levels#new'
  get '/levels/:id', to: 'levels#show'
  post '/levels', to: 'levels#create'
  get '/levels/:level_id/edit', to: 'levels#edit'
  patch '/levels/:level_id', to: 'levels#update'

  get '/monsters', to: 'monsters#index'
  get '/monsters/:id', to: 'monsters#show'
  get '/monsters/:id/edit', to: 'monsters#edit'
  patch '/monsters/:id', to: 'monsters#update'

  get '/roles', to: 'roles#index'
  get '/roles/new', to: 'roles#new'
  get '/roles/:id', to: 'roles#show'
  post '/roles', to: 'roles#create'
  get '/roles/:role_id/edit', to: 'roles#edit'
  patch '/roles/:role_id', to: 'roles#update'

  get '/weapons', to: 'weapons#index'
  get '/weapons/:id', to: 'weapons#show'
  get '/weapons/:id/edit', to: 'weapons#edit'
  patch '/weapons/:id', to: 'weapons#update'

  get '/roles/:role_id/weapons', to: 'role_weapons#index'
  get '/roles/:role_id/weapons/new', to: 'role_weapons#new'
  get '/roles/:role_id/weapons/by_name', to: 'role_weapons#index_by_name'
  post '/roles/:role_id/weapons', to: 'role_weapons#create'

  get '/levels/:level_id/monsters', to: 'level_monsters#index'
  get '/levels/:level_id/monsters/new', to: 'level_monsters#new'
  post '/levels/:level_id/monsters', to: 'level_monsters#create'
end
