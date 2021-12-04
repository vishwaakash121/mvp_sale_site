Rails.application.routes.draw do
  root "pages#home"
  resources :deals
  get 'sell_product', to: 'deals#sell_product'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
