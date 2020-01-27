Rails.application.routes.draw do
  root :to => "web/surveys#index"

  scope module: :web do
    resource :surveys
    resource :session, only: [:new, :create, :destroy]
  end

  namespace :admin do
    resources :users
  end

end
