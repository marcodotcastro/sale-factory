if Rails.env.production?
  PagarMe.api_key = ENV['API_KEY']
  PagarMe.encryption_key = ENV['ENCRYPTION_KEY']
else
  PagarMe.api_key = ENV['API_KEY']
  PagarMe.encryption_key = ENV['ENCRYPTION_KEY']
end
