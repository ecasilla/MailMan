Mailman::Application.routes.draw do
  
  root :to => "welcome#index"
  get '/about' => 'welcome#about'
  
  resources :users, except: [:index] do
    resources :campaigns, shallow: true, except: [:destroy] do
      resource :email_template, shallow: true, only: [:new, :create, :edit, :update]
      resource :send_email, shallow: true, only:[:create,:show]
    end

    resources :recipients, shallow: true, only: [:new, :create, :index]
  end

  resource :session, only: [:new, :create, :destroy]
  resource :contact, only: [:new, :create, :show]
end
