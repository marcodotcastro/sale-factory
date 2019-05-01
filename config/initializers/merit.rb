# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  config.add_observer 'ReputationChangeObserver'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  config.user_model_name = 'Usuario'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  config.current_user_method = 'current_usuario'
end

#Lojista
Merit::Badge.create!(id: 1, name: "1-lojista", description: "1º lojista", level: 1)
Merit::Badge.create!(id: 2, name: "10-lojista", description: "10º lojista", level: 2) #NOTE: Não é possível acessar o current_usuario na rules do merit

#Representante
Merit::Badge.create!(id: 3, name: "perfil", description: "Perfil cadastrado")
