Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  root "site#index"

  get "/observations", to: "observations#index"
  resource :observations

  get "/observation_session/new", to: "observation_sessions#new"
  get "/observation_session/end", to: "observation_sessions#end"
  get "/observation_session/:id", to: "observation_sessions#show"
end
