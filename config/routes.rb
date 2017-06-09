Rails.application.routes.draw do
  get 'students/create'

  get 'students/set_students'

  resources :universities do
    resources :students
  end
  get 'attendees/register'

  get 'attendees/deregister'

  resources :tags
  resources :posts
  resources :events do
    resources :attendees
    member do
      get 'register', to: 'events#register'
      get 'deregister', to: 'events#deregister'
    end
  end
  devise_for :users
  get 'home/index'
  get 'search', to: :index, controller: 'search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :conversations do
    resources :messages
  end
end
