Rails.application.routes.draw do

  devise_for :users
  
  resources :user_infos do
    collection do
      get 'settings'
    end
  end
  resources :pins do
    member do
      put "like", to: "pins#upvote"
    end
  end

  get '/profile' => 'user_infos#index', as: 'profile_pin'
  get '/all/pins' => 'pins#fetch'
  get '/getpin/pin/:id' => 'pins#getPin'
  get '/deletepin/pin/:id' => 'pins#destroy'
  
  get 'user_infos/getmypins' => 'user_infos#show', as: 'get_my_pins'

  post '/savepin/pin' => 'pins#save_pin'
  post '/profile/saveinfo' => 'user_infos#create', as: 'profile_save_info'

  root 'pins#index'
end
