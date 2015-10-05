Rails.application.routes.draw do

  devise_for :users
  resources :images, shallow: true do
    resources :comments do
      resources :likes
    end
  end

  root to: "images#index"

end
