Rails.application.routes.draw do
  resources :users do
    collection do
      get :new_upload
      post :upload
    end
  end
  root 'welcome#index'
end
