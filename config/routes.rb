Rails.application.routes.draw do
  resources :nominations
  get 'search/index'
  get 'nominated/nominate'
  get 'welcome/index'


  root 'welcome#index'
end
