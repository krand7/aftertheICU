Rails.application.routes.draw do

  scope 'learn' do
    get '/', to: 'learn#index', as: 'learn'
    get '/:content_page_slug', to: 'learn#show', as: 'learn_page'
  end

  namespace :admin do
    get '/', to: :dashboard
    resources :team_members
    resources :partners
    resources :highlights
    resources :consent_forms do
      member do
        post :preview
      end
    end
    resources :content_groups do
      resources :content_pages do
        member do
          post :preview
        end
      end
    end
  end

  resources :research_topics do
    resources :comments
    resources :votes
  end
  get 'members', to: 'members#index'
  get 'members/:forum_name', to: 'members#show', as: 'member'
  get 'leaderboards', to: 'members#leaderboards'
  get 'settings', to: 'account#settings'
  patch 'settings', to: 'account#update', as: 'update_settings'

  resources :forums do
    resources :topics do
      resources :posts do
        collection do
          post :preview
        end
      end
    end
  end
  scope module: 'application' do
    get :dashboard
    get :version
    get :welcome
    get :team
    get :partners
    get :privacy_policy
  end

  devise_for :users, controllers: { registrations: 'registrations' }, path_names: { sign_up: 'join', sign_in: 'login', sign_out: 'logout' }, path: "/"

  root to: 'application#welcome'

end
