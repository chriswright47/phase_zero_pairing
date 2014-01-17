PhaseZeroPairing::Application.routes.draw do

  get '/' => 'static_pages#home', as: 'home'

  resources :users

  resources :appointments

  resources :sessions, only: [:new, :delete]

end
