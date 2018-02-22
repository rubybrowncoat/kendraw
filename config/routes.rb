Rails.application.routes.draw do
  get 'saved_boards/:url', to: 'saved_board#show', as: 'saved_board'
  get 'saved_boards', to: 'saved_board#index', as: 'saved_boards'
  post 'saved_boards', to: 'saved_board#create'

  get 'shared_boards/:url', to: 'shared_board#show', as: 'shared_board'
  get 'shared_boards', to: 'shared_board#index', as: 'shared_boards'
  post 'shared_boards', to: 'shared_board#create'

  post 'shared_actives', to: 'shared_active#create'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
