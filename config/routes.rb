Rails.application.routes.draw do
  root 'top#index'

  get 'notifications/index'

  # devise_for :
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  resources :users, only: [:index, :show]
  resources :relationships, only: [:create, :destroy]
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
  resources :blogs do
    resources :comments
    post :confirm, on: :collection
  end
  resources :poems, only: [:index, :show]
  resources :contacts, only: [:index, :new, :create] do
    collection do
      post :confirm
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # letter_opener_webのroutingの設定
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
