Rails.application.routes.draw do
  get 'ipfs-upload', to: 'tokens#ipfsUpload'
  get 'latest-mint', to: 'tokens#latestMint'
  # get 'pages/mint'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"

  resources :pages
  resources :tokens do
    resources :sale, except: :index
  end

end
