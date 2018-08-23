Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "robot#index"
  get '/play', to: 'robot#play'
  post '/play', to: 'robot#run'
end
