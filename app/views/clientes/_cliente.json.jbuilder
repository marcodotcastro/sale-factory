json.extract! cliente, :id, :descricao, :contato, :endereco, :cep, :telefone, :latitude, :longitude, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
