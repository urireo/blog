Rails.application.routes.draw do

  resources :costumers
  resources :posts do
    resources :comments
  end

  resources :pages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
