Checkins::Application.routes.draw do

  resources :tags
  resources :checkins do
    collection do
      get 'map'
    end
  end




  get "static/index"
  get "static/map"

  match "/login" => "static#login"
  match "/callback" => "static#callback"

  root :to => 'static#index'
end
