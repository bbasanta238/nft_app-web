Rails.application.routes.draw do
  get 'mint_token', to: 'pages#mint'
  get 'ipfs-upload', to: 'pages#ipfsUpload'
  get 'latest-mint', to: 'pages#latestMint'
  # get 'pages/mint'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"

  resources :pages
end
