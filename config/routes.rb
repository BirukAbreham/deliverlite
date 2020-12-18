Rails.application.routes.draw do
  resources :contacts, only: [ :index, :show, :create, :update, :destroy ] do
    collection do
      get 'search', to: 'contacts#search'
    end
    member do
      get 'activities', to: 'contacts#activity'
      get 'groups', to: 'contacts#groups'
    end
  end

  resources :groups, only: [ :index, :show, :create, :update, :destroy ] do
    member do
      get 'contacts', to: 'groups#contacts'
      get 'campaigns', to: 'groups#campaigns'
    end
  end

  resources :campaigns, only: [ :index, :show, :create, :update, :destroy ] do
    member do
      get 'activities', to: 'campaings#activity'
      get 'groups', to: 'campaings#groups'
    end
  end
end
