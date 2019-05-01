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

#Representante
Merit::Badge.create!(id: 1, name: "perfil", description: "Perfil cadastrado")
#Venda
Merit::Badge.create!(id: 100, name: "1-venda", description: "1º venda", level: 1)
Merit::Badge.create!(id: 101, name: "5-venda", description: "1º venda", level: 2)
Merit::Badge.create!(id: 102, name: "10-venda", description: "10º venda", level: 3)
Merit::Badge.create!(id: 103, name: "50-venda", description: "50º venda", level: 4)
Merit::Badge.create!(id: 104, name: "100-venda", description: "100º venda", level: 5)
#Equipe
Merit::Badge.create!(id: 200, name: "1-membro", description: "1º membro", level: 1)
Merit::Badge.create!(id: 201, name: "5-membro", description: "5º membro", level: 2)
Merit::Badge.create!(id: 202, name: "10-membro", description: "10º membro", level: 3)
Merit::Badge.create!(id: 203, name: "25-membro", description: "25º membro", level: 4)
Merit::Badge.create!(id: 204, name: "50-membro", description: "50º membro", level: 5)

#Lojista
Merit::Badge.create!(id: 300, name: "1-lojista", description: "1º lojista", level: 1)
Merit::Badge.create!(id: 301, name: "10-lojista", description: "10º lojista", level: 2) #NOTE: Não é possível acessar o current_usuario na rules do merit

