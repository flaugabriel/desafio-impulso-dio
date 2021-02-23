Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '708945469902-197cdpq325dupf0b3nj5sokog2obv7pv.apps.googleusercontent.com', 'intR1OgWQlxHJKzUwGEnqEo8', provider_ignores_state: true
end