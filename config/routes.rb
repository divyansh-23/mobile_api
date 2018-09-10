Rails.application.routes.draw do
  devise_for :users
  use_doorkeeper
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :users, only: [:user] do
      collection do
        get :search
      end
    end
  end

end
