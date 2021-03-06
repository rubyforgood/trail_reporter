Rails.application.routes.draw do
  resources :tags
  resources :comments
  resources :trails
  resources :categories
  resources :reports

  devise_for :users

  root 'home#index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :sessions, only: [:create] do
        delete :destroy, on: :collection
      end
      resources :reports, only: [:index, :create]
    end
  end

end
