Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  root "site#index"

  get "/observations", to: "observations#index"
  resources :observations

  get "/observation_sessions/start", to: "observation_sessions#start"
  get "/observation_sessions/end", to: "observation_sessions#end"
  # get "/observation_sessions/:id", to: "observation_sessions#show"
  resources :observation_sessions

  get "/profile", to: "profile#index"
  resources :profile

  get "/high_scores", to: "high_scores#index"
#  get "/high_score", to: "high_scores#index"
#  get "/high-score", to: "high_scores#index"
#  get "/high-scores", to: "high_scores#index"
#  resources :high_scores
end
