Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get 'items/index'
  resources :items, only: [:index, :new, :create, :show, :edit, :update]  do
  end  
end
