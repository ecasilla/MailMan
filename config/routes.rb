Mailman::Application.routes.draw do
  
  root :to => "welcome#index"
  get '/about' => 'welcome#about'
  get '/contact' => 'welcome#contact'
  
  resources :users, except: [:index] do
    resources :campaigns, shallow: true do
      resource :email_template, shallow: true, only: [:new, :create, :edit, :update]
    end

    resources :recipients, shallow: true, only: [:new, :create, :index]
  end

  resource :session, only: [:new, :create, :destroy]
end
