Rails.application.routes.draw do
  get 'saved_boards/:url', to: 'saved_board#show', as: 'saved_board'
  get 'saved_boards', to: 'saved_board#index', as: 'saved_boards'
  post 'saved_boards', to: 'saved_board#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
