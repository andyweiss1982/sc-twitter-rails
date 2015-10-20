Rails.application.routes.draw do

  get 'twitter/new', to: 'twitter_calls#new', as: :new_twitter_call
  post 'twitter', to: 'twitter_calls#create', as: :post_twitter_call
  get 'twitter/show', to: 'twitter_calls#show', as: :twitter_call

  root 'twitter_calls#new'

  devise_for :users
end
