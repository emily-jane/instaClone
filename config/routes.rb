Rails.application.routes.draw do

  devise_for :users
  resources :images do
    resources :comments
  end

  root to: "images#index"

end
