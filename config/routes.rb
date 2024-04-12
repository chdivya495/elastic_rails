Rails.application.routes.draw do 
  namespace :api do
    namespace :v1 do
      resources :verticals do
        resources :categories
        get 'search', to: 'verticals#search'
      end
      resources :categories do
        resources :courses
          get 'search', to: 'courses#search'
          get 'search', to: 'categories#search'
      end
    end
  end
end