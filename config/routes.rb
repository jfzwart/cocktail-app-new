Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "cocktails#index"
  resources :cocktails do
    resources :doses, only: [:new, :create, :edit, :destroy]
    resources :reviews, only: [:create, :edit, :destroy]
  end
  resources :doses, only: [:new]
end