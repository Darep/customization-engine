Rails.application.routes.draw do
  namespace :api do
    resources :customizations, only: [:index, :show, :create, :update, :destroy]
    resources :themes, only: [:index, :show]
  end

  get '/demo' => 'welcome#index'
end
