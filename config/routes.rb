Mailman::Application.routes.draw do
  
  root :to => "welcome#index"
  
  resources :users, except: [:index] do
    resources :campaigns
    resources :email_templates
  end

  resources :recipients 
  

  resource :session, only: [:new, :create, :destroy]
end
