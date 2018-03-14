Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#pets'
  get 'dogs', to: 'welcome#dogs'
  get 'cats', to: 'welcome#cats'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  resources :articles
end
