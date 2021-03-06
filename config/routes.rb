Rails.application.routes.draw do
  get 'sports', to: 'category#sports'
  get 'technology', to: 'category#technology'
  get 'arts', to: 'category#arts'
  get 'theater', to: 'category#theater'
  get 'news', to: 'category#news'
  get 'politics', to: 'category#politics'
  get 'health', to: 'category#health'
  get 'food', to: 'category#food'





  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :statistics
  resources :rsvps
  resources :httparty_tests
  resources :category_events
  resources :calendars
  resources :categories
  devise_for :users, controllers: {registrations: "registrations" }
  resources :events do
    member do
      put 'like' => 'events#heart'
    end
  end

  resources :events do
    member do
      put 'rsvp' => 'events#rsvp'
    end
  end

  resources :events do
    member do
      get 'pdf' => 'events#pdf'
    end
  end

  get 'welcome/calendar'
  get 'events', to: 'events#index'

  
	# Set the default page for the web app.
  root to: 'welcome#index'
  mount Commontator::Engine => '/commontator/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
