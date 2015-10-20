Rails.application.routes.draw do

  resources :twitter_calls, except: [:edit, :destroy, :index]
  devise_for :users

  root new_twitter_call_path
end
