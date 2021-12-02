Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/levels', to: 'levels#index'
  get '/levels/:id', to: 'levels#show'
  get '/monsters', to: 'monsters#index'
  get '/monsters/:id', to: 'monsters#show'
  get '/roles', to: 'roles#index'
  get '/roles/:id', to: 'roles#show'
  get '/weapons', to: 'weapons#index'
  get '/weapons/:id', to: 'weapons#show'
  get '/levels/:level_id/monsters', to: 'level_monsters#index'
end
