Rails.application.routes.draw do
  resources :directors, :stars, :writers, :person

  resources :movies do
    resources :ratings
  end

  post 'movies/upload', as: :upload, to: 'movies#import'

  root 'movies#index'
end
