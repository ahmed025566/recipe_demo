Rails.application.routes.draw do
  resources :foods, only: [:new, :create]
  resources :recipe_foods, only: [:new, :create]
  get 'public_recipes', to: 'public_recipes#index'
  devise_for :users
  resources :recipes, only: [:index, :show, :new, :create, :destroy, :update] do
    member do
      delete :destroy
    end
  end
  
  root "recipes#index"
end
