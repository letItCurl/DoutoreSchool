Rails.application.routes.draw do
  namespace :back_office do
    resources :forms, only: [:new, :edit, :index, :destroy, :update, :create]
  end

  namespace :front_office do
    resources :forms_uploads
    resources :forms, only: [:new, :edit, :index, :update, :create]
  end

  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }

  root "home#index"
end
