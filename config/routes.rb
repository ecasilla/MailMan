Mailman::Application.routes.draw do
  
  resources :users, except: [:index]

  resources :recipents do
    collection { post :import }
  end
  resource :session, only: [:new, :create, :destroy]
end
