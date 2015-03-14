Rails.application.routes.draw do
  root 'home#index'
  get "/auth/facebook/callback" ,to: "sessions#create"
  get "/signout", to: "sessions#destroy"

  resources :gifts, only: [] do
    collection do
      get 'recommendation'
    end
  end

  resources :friends, only: [:new, :index]
  resources :funds, only: [:new, :create, :show]
  resources :contributions, only: [:new]
end
