Testo::Application.routes.draw do
  resources :articles

  concern :commentable do
      resources :comments
  end
  resources :articles, concerns: :commentable
  resources :photos, concerns: :commentable

  get 'foo', to: 'articles#index', constraints: {protocol: "https", subdomain: "test"}
end
