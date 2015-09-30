Rails.application.routes.draw do

  resources :surveys

  namespace :builder do
    resources :surveys, shallow: true do
      resources :questions do
        resources :answer_templates do
          resources :answer_options
        end
      end
    end

    get '', to: redirect("builder/surveys")
  end

  resources :research_topics do
    resources :comments
    resources :votes
  end

  resources :forums do
    resources :topics do
      resources :posts do
        collection do
          post :preview
        end
      end
    end
  end

  get 'members', to: 'members#index'
  get 'members/:forum_name', to: 'members#show', as: 'member'
  get 'leaderboards', to: 'members#leaderboards'
  get 'settings', to: 'account#settings'
  patch 'settings', to: 'account#update', as: 'update_settings'

  scope module: 'application' do
    get :dashboard
    get :version
    get :welcome
  end

  devise_for :users, controllers: { registrations: 'registrations' }, path_names: { sign_up: 'join', sign_in: 'login', sign_out: 'logout' }, path: "/"

  root to: 'application#welcome'

end
