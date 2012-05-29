Rails.application.routes.draw do

  resources :manuscripts

  get "home/index"

  root to: "home#index"

  mount Iso639Config::Engine => "/iso639"
end
