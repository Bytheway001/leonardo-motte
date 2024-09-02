Rails.application.routes.draw do
  resources :contacts, only: [:create, :index, :show, :update, :destroy]
end