Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  get 'saved_boards/:url/preview', to: 'saved_board#preview', as: 'saved_board_preview'
  get 'saved_boards/:url', to: 'saved_board#show', as: 'saved_board'
  get 'saved_boards', to: 'saved_board#index', as: 'saved_boards'
  post 'saved_boards', to: 'saved_board#create'

  get 'shared_boards/:url/preview', to: 'shared_board#preview', as: 'shared_board_preview'
  get 'shared_boards/:url', to: 'shared_board#show', as: 'shared_board'
  get 'shared_boards', to: 'shared_board#index', as: 'shared_boards'
  post 'shared_boards', to: 'shared_board#create'

  post 'shared_actives', to: 'shared_active#create'

  # ActiveAdmin
  ActiveAdmin.routes(self)

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
