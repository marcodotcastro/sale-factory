require 'csv'

AdminUser.create!(email: 'admin@elevatesales.com.br', password: '12345678', password_confirmation: '12345678')

puts "#Estados"
# Importa Cidades com a geolocation para consumir app google
ActiveRecord::Base.connection.execute(IO.read("db/sqls/cidades.sql"))

# Cadastra Estado ainda não Cadastrados

# CSV.foreach("spec/files/cidades.csv", headers: :true) do |row|
#   data = row.to_hash
#   if data["estado"].eql? "GO"
#     cidade = Cidade.new
#     cidade.estado = data["estado"]
#     cidade.codigo = data["codigo"]
#     cidade.descricao = data["descricao"]
#     cidade.populacao = data["populacao"].sub(".", "").to_i
#     cidade.save
#     puts cidade.descricao
#     puts "#{cidade.longitude}, #{cidade.latitude}"
#   end
# end

["Farmacêutico", "Construção", "Alimentos", "Serviços Industrial de Utilidade Pública", "Derivados de Petróleo e Biocomustíveis", "Químicos", "Metalurgia"].each do |descricao|
  Setor.create(descricao: descricao)
end

Plano.create(descricao: "2 Convites", numero_convites: 2, preco: 0)
Plano.create(descricao: "10 Convites", numero_convites: 10, preco: 300, gateway_id: "427635")
Plano.create(descricao: "25 Convites", numero_convites: 25, preco: 750, gateway_id: "427675")
Plano.create(descricao: "50 Convites", numero_convites: 50, preco: 1500, gateway_id: "427676")


if Rails.env.production?

  puts "#Indústrias"
  FactoryBot.create_list(:industria, 1)

  puts "#Produtos"
  FactoryBot.create_list(:produto, 2)

  puts "#Representantes"
  FactoryBot.create_list(:representante, 2)

  puts "#Lojistas"
  FactoryBot.create_list(:lojista, 10)

  puts "#Solicitações e Pedidos"
  FactoryBot.create_list(:solicitacao, 200, :com_pedido)

end

if Rails.env.development?

  puts "#Indústrias"
  FactoryBot.create_list(:industria, 2)

  puts "#Produtos"
  FactoryBot.create_list(:produto, 10)

  puts "#Representantes"
  FactoryBot.create_list(:representante, 10)

  puts "#Lojistas"
  FactoryBot.create_list(:lojista, 200)

  puts "#Solicitações e Pedidos"
  FactoryBot.create_list(:solicitacao, 2000, :com_pedido)

end
