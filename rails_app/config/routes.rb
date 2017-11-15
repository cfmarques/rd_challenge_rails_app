Rails.application.routes.draw do
  post '/track', to: 'tracking#track'
  resources :contacts, only: [ :index, :show ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
