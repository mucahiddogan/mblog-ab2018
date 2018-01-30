Rails.application.routes.draw do
  devise_for :users
  resources :users
  get 'welcome/index'
  get 'events/:event', to: 'events#show'
  # get ':language/articles', to: 'languages#show'
  get 'tr/articles', to: 'languages#tr_show'
  get 'en/articles', to: 'languages#en_show'

  resources :articles do
       resources :comments
  end

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
