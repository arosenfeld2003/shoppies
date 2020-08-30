Rails.application.routes.draw do
  resources :nominations
  get 'search/index'

  get 'nominations/index'
  get 'nominations/nominate'
  delete 'nominations/destroy'
  delete 'nominations/clear'

  get 'welcome/index'


  root 'welcome#index'
end
