Mailman::Application.routes.draw do
  
  root :to => "welcome#index"
  
  resources :users, except: [:index] do
    resources :campaigns
    resources :templates
  end

  resources :recipients do
    collection { post :import }
  end

  resource :session, only: [:new, :create, :destroy]
end
