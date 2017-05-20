Rails.application.routes.draw do
  get 'conversations/index'

  resources :events
  devise_for :users
  get 'home/index'
  get 'search', to: :index, controller: 'search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :conversations do
    resources :messages
  end
end
