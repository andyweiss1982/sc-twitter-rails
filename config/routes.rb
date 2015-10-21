Rails.application.routes.draw do

  resources :twitter_calls, except: [:edit, :destroy, :index, :update]
  devise_for :users

  root 'twitter_calls#new'
end
