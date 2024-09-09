Rails.application.routes.draw do
  resources :contacts do
    get 'employment_histories', on: :member  # Custom route to fetch employment histories for a contact
    resources :employment_histories, only: [:index, :show, :create, :update, :destroy]
    get 'matches', on: :member
  end

  resources :roles do
    get 'matches', on: :member
  end

  resources :matches, only: [:create, :destroy, :index, :show]

  resources :companies do
    resources :employment_histories, only: [:index, :show, :create, :update, :destroy]
  end
end