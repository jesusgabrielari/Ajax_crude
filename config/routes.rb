Rails.application.routes.draw do
    #Ruta Raiz
    root 'blogs#index'
    #Todas las rutas
    resources :blogs
    #Ruta del Search
    get 'blogs/search', as: 'search'
    #Ruta del Index
    #get 'blogs/index', as: 'blogs'
    #Ruta del New
    #get 'new', to: 'blogs#new', as: 'new'
    #Ruta del Crear
    #post 'create', to: 'blogs#create', as: 'create'
end
