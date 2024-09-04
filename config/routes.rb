Rails.application.routes.draw do
  resources :contacts do
    # Obtiene los 'matches' de un contacto
    get 'role_count', to: 'contacts#role_count', on: :member
  end

  resources :roles do
    # Obtiene los 'matches' de un rol
    get 'matches', to: 'roles#matches_for_role', on: :member
  end

  resources :matches, only: [:create, :destroy, :index, :show] do
    get 'contacts/:contact_id/matches', to: 'matches#matches_for_contact', on: :collection
  end
end
