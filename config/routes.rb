Rails.application.routes.draw do
  resources :contacts do
    member do
      get 'employment_histories'  
      get 'matches'  
    end

   
    resources :roles do
      member do
        get 'matches'  
      end
    end

    resources :matches, only: [:create, :destroy, :index, :show]
  end


  resources :companies do
    resources :employment_histories, only: [:index, :show, :create, :update, :destroy]
  end
  resources :education_histories
end