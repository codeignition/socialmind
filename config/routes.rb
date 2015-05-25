Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    authenticated :user do
      resources :invitations, only: [:create,:destroy]
      resources :twitter_accounts, only: [:show] do
        post :tweet, on: :member
        post :invite, on: :member
        get :collaborators, on: :member
        get :home_timeline, on: :member
      end
      get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
      root to: 'users#index', as: :user_root
    end

    unauthenticated :user do
      get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    end
  end

  unauthenticated do
    root to: 'home#index', as: :root
  end
end
