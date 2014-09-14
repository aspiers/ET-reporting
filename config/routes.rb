Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  mount Surveyor::Engine => "/surveys", :as => "surveyor"

  resources :admin do
    post :invite, on: :collection
  end
end
