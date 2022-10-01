Rails.application.routes.draw do
  root 'static_pages#top'
  get '/signup', to: 'users#new'

  # ログイン機能
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')  


  resources :users do
    member do
      post '/pdcas/:id/done' => 'pdcas#done',   as: 'done'
    end
    resources :pdcas 
      post 'pdca/complete'
  end

end