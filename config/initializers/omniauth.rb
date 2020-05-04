Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, Rails.application.credentials.github_omniauth[:client_id], Rails.application.credentials.github_omniauth[:client_secret], scope: "user"
end
