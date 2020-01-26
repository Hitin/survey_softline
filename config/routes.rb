Rails.application.routes.draw do
  root :to => "web/surveys#index"

  scope module: :web do
    resource :surveys
    resource :session, only: [:new, :create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
