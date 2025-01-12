Rails.application.routes.draw do
  resources :jobs
  devise_for :users
  get '/sample_jobs', to: "jobs#sample_jobs"
  get '/statuses', to: "statuses#index"
  get '*path', to: 'home#index', constraints: ->(request){ request.format.html? }
  root 'home#index'  
end
