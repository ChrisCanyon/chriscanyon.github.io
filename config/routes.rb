Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'login#new'
  post 'create_board', to: 'login#create'
  get 'boards/:id/:nickname', to: 'boards#show', as: 'boards'
  post '/boards/:id/:beer_index', to: 'boards#update', as: 'update_board'
  get 'drink_log', to: 'drink_log#index'
  get 'leader_board', to: 'leader_board#index'
end
