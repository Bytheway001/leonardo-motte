Rails.application.routes.draw do
  resources :contacts do
    # Ruta para obtener los matches de un contacto específico
    get 'matches', to: 'matches#matches_for_contact', on: :member
  end

  resources :roles do
    # Ruta para obtener los matches de un rol específico
    get 'matches', to: 'roles#matches_for_role', on: :member
  end

  # Define las rutas para crear, eliminar, listar y mostrar matches
  resources :matches, only: [:create, :destroy, :index, :show]
end