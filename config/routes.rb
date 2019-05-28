Rails.application.routes.draw do
  devise_for :users
  root "tweets#index"
  resources :tweets, only: [:index, :new, :edit, :create, :destroy, :update, :show]

end
