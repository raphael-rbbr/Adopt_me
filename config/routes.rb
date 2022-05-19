Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pets do
    resources :adoptions, only: [:new, :create, :delete]
  end
  resources :users, only: [:show]
  get 'users/my_pets/:id', to: 'users#my_pets'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
