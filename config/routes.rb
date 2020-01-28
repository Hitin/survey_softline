Rails.application.routes.draw do
  root :to => "web/surveys#index"

  scope module: :web do
    resource :surveys
    resource :session, only: [:new, :create, :destroy]
  end

  namespace :admin do
    resources :users
  end

  namespace :api do
    namespace :v1 do
      resources :surveys, only: [:index, :show, :create, :update, :destroy]
      resources :questions, only: [:index, :show, :create, :update, :destroy]
    end
  end

end
