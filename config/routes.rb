Rails.application.routes.draw do

  root 'pages#home'
  devise_for :users, controllers: {registrations: "registrations"}
  resources :places
  resources :reviews, only: [:create, :edit, :update, :destroy]

end
