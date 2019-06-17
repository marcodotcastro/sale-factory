if Rails.env.production?
  PagarMe.api_key = 'ak_test_xBv7ECgxSKfpuFOuMY1LnNADwceHfo'
  PagarMe.encryption_key = 'ek_test_UCr02l6LB5o6HXuqNOi7wYD2DT7Q2p'
else
  PagarMe.api_key = 'ak_test_xBv7ECgxSKfpuFOuMY1LnNADwceHfo'
  PagarMe.encryption_key = 'ek_test_UCr02l6LB5o6HXuqNOi7wYD2DT7Q2p'
end
