Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  root "site#index"

  get "/observations", to: "observations#index"
  resources :observations

  get "/observation_sessions/start", to: "observation_sessions#start"
  get "/observation_sessions/end", to: "observation_sessions#end"
  # get "/observation_sessions/:id", to: "observation_sessions#show"
  resources :observation_sessions
end
