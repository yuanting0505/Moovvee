Moovvee::Application.routes.draw do
  get '/signup' =>'users#new'
  get '/signin' => 'sessions#new'
  delete '/signout'=> 'sessions#destroy'
  resources :users
  resources :sessions,only:[:new,:create,:destroy]

  root 'static_pages#home'
end
