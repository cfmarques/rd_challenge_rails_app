Rails.application.routes.draw do
  root 'contacts#index'

  post '/track', to: 'tracking#track'

  resources :contacts, only: [ :index, :show ]
end
