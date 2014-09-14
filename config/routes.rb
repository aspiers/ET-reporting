Rails.application.routes.draw do
  devise_for :users

  mount Surveyor::Engine => "/surveys", :as => "surveyor"

  root 'surveyor#show'

  resources :admin do
    post :invite, on: :collection
  end
end
