Rails.application.routes.draw do

  devise_for :users
  resources :pins do
    member do
      put "like", to: "pins#upvote"
    end
  end

  get '/profile' => 'pins#profile', as: 'profile_pin'
  get '/all/pins' => 'pins#fetch'
  get '/getpin/pin/:id' => 'pins#getPin'
  get '/deletepin/pin/:id' => 'pins#destroy'
  post '/savepin/pin' => 'pins#save_pin'
  root 'pins#index'
end
