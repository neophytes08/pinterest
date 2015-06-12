Rails.application.routes.draw do

  devise_for :users
  resources :user_infos
  resources :pins do
    member do
      put "like", to: "pins#upvote"
    end
  end

  get '/profile' => 'profile#profile', as: 'profile_pin'
  get '/all/pins' => 'pins#fetch'
  get '/getpin/pin/:id' => 'pins#getPin'
  get '/deletepin/pin/:id' => 'pins#destroy'
  post '/savepin/pin' => 'pins#save_pin'
  #get '/profile/info' => 'profile#info', as: 'new_profile'
  # get '/profile/saveinfo' => 'profile#create', as: 'save_info_profile'

  root 'pins#index'
end
