VkontakteApi.configure do |config|
  # Authorization parameters (not needed when using an external authorization):
  config.app_id       = '3029947'
  config.app_secret   = 'Mo37hDKTiI3OCUmsSkuH'
  config.redirect_uri = 'http://vkontakte-on-rails.dev/callback'
  
  # Faraday adapter to make requests with:
  # config.adapter = :net_http
  
  # Logging parameters:
  # log everything through the rails logger
  config.logger = Rails.logger
  
  # log requests' URLs
  # config.log_requests = true
  
  # log response JSON after errors
  # config.log_errors = true
  
  # log response JSON after successful responses
  # config.log_responses = false
end
