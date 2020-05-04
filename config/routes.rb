Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'auth/github/callback', to: 'sessions#callback'
  get '/sign_out', to: 'sessions#destroy'

  root 'homes#top'
end
