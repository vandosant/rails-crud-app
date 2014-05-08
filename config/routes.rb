Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get '/bands', to: 'bands#index'

  get '/bands/new', to: 'bands#new'

  post '/bands', to: 'bands#create'

  get '/bands/:id', to: 'bands#show'

  get '/bands/:id/edit', to: 'bands#edit'

  put '/bands/:id', to: 'bands#update'

  delete '/bands/:id', to: 'bands#delete'

  get '/colors', to: 'colors#index'

  get '/colors/new', to: 'colors#new'

  post '/colors', to: 'colors#create'

  get '/colors/:id', to: 'colors#show'

  get '/colors/:id/edit', to: 'colors#edit'

  put '/colors/:id', to: 'colors#update'

  delete '/colors/:id', to: 'colors#delete'

  resources :wines
end
