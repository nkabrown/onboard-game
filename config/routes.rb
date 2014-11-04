Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  devise_for :users, controllers: { sessions: 'users/sessions', invitations: 'invitations' }

  authenticated :admin do
    root :to => "admins#index", :as => "authenticated_admin"
  end

  authenticated :user do
    root :to => 'users#index', :as => 'authenticated_user'
  end

  resources :announcements, only: [:new, :create, :edit, :update, :destroy]
  resources :todos, only: [:new, :create, :edit, :update, :destroy]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get 'admins' => "admins#home"
  get 'admins/dashboard' => "admins#index"

  # You can have the root of your site routed with "root"
  root 'users#home'

  get 'users/dashboard' => 'users#index'
  get 'user/:id' => 'users#show', :as => 'show_user'
  get 'user/:id/edit' => 'users#edit', :as => 'edit_user'
  put 'user/:id/edit' => 'users#update'
  patch 'user/update_password' => 'users#update_password'
  patch 'user/:id/edit' => 'users#update'


  get 'projects' => 'projects#index'
  get 'user/:id/project/new' => 'projects#new', :as => 'new_project'
  post '/projects' => 'projects#create'
end
