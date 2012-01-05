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
      match '/auth/:provider/callback' => 'omniauth#callback'
      match '/auth/failure' => 'omniauth#failure'
      resources :connections, only: [:index, :create, :destroy]
      resource :user
      root to: "posts#index"
    end
  end

  devise_for :user,     skip: :registrations
  resource   :user,     only: :show,           path: "/about"
  resources  :clients,  only: :index,          path: "/work"
  resources  :posts,    only: [:index, :show], path: "/blog/posts"
  resources  :services, only: [:index, :show]

  # Dynamic Root Route
  root to: "users#show"
  
end
