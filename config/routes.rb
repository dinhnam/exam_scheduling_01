Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "subjects#index"
    resources :subjects do
      collection do
        post 'add'
        get 'remove'
      end
    end
    resources :rooms
    resources :schedules
    resources :users
  end

  draw :admin

  get "/login", to: "login#new"
  post "/login", to: "login#create"

  resource :subject, only: [:show]
  namespace :admin do
  	resource :subject, except: [:new, :create, :destroy]
  end

  get "/getedit/:id", to: "students#edit"
  resources :students
  root "students#new"
end
