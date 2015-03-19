Rails.application.routes.draw do
  resources :customizations

  root 'welcome#index'
end
