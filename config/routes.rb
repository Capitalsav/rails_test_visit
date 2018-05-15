Rails.application.routes.draw do
  resources :users, only: [:new, :index, :create, :update, :delete]
  root 'welcome#index'
  match '/users/upload', to: 'users#upload', via: 'post', as: 'upload_users'
  match '/users/new_upload', to: 'users#new_upload', via: 'get', as: 'new_upload_users'
end
