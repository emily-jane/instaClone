Rails.application.routes.draw do

  devise_for :users
  resources :images, shallow: true do
    resources :comments
    resources :likes
  end

  root to: "images#index"

end
