Rails.application.routes.draw do

  devise_for :users
  resources :contacts
  resources :products
  resources :charges
  get "/about" => "pages#about"
  get "/policy" => "pages#policy"
  root "pages#home"
end
