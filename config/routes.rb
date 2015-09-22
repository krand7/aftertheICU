Rails.application.routes.draw do

  resources :forums do
    resources :topics do
      resources :posts
    end
  end
  scope module: 'application' do
    get :dashboard
    get :version
    get :welcome
  end

  devise_for :users, path_names: { sign_up: 'join', sign_in: 'login', sign_out: 'logout' }, path: ""

  root to: 'application#welcome'

end
