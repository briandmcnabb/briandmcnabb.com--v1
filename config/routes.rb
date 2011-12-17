Briandmcnabb::Application.routes.draw do

  # Backend Administrative Interface
  constraints subdomain: "admin" do
    scope module: "admin", as: "admin"  do
      resources :services do
        collection { post :sort }
        resources :skills
      end
      resources :clients do
        collection { post :sort }
        resources :projects
      end
      resources :inquiries
      resources :posts do
        collection { post :sort }
      end
      match '/auth/:provider/callback' => 'connections#create'
      match '/auth/failure' => 'connections#failure'
      resources :connections, only: [:index, :create, :destroy]
      resource :user
      root to: "posts#index"
    end
  end

  devise_for :user, skip: :registrations
  resource  :user, only: :show
  resources :clients, only: :index
  resources :posts, only: [:index, :show]
  resources :services, only: [:index, :show]

  # Dynamic Root Route
  root to: "users#show"
  
end
