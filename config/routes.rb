Rails.application.routes.draw do

  root 'static_pages#index'

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resource :bank_account, only: [:new, :create]
  resource :verification, only: [:edit, :update]
  resources :payments, only: [:index]
  resources :assessments do
    resources :submissions
    resources :requirements
  end

  # Frontend test routes ------------------------------------
  resources :teachers

  resources :students
end

