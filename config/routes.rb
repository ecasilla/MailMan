Mailman::Application.routes.draw do
  
  root :to => "welcome#index"
  get '/about' => 'welcome#about'

  namespace :api do
      resources :campaigns
  end
  
  resources :users, except: [:index] do
    resources :campaigns, shallow: true, except: [:destroy] do
      resource :email_template, shallow: true, only: [:new, :create, :edit, :update]
      
      member do 
        get 'send_email'
      end
    end

    resources :recipients, shallow: true, only: [:new, :create, :index]
  end

  resources :recipients do
    collection do
      post :import
    end
  end

  mount Resque::Server, :at => "/resque"

  resource :session, only: [:new, :create, :destroy]
  resource :contact, only: [:new, :create, :show]
end
