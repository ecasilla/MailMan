Mailman::Application.routes.draw do
  
  root :to => "welcome#index"
  get '/about' => 'welcome#about'
  get '/contact' => 'welcome#contact'
  
  resources :users, except: [:index] do
    resources :campaigns, shallow: true do
      resource :email_template, shallow: true
    end
  end

  resources :recipients 


  resource :session, only: [:new, :create, :destroy]
end
