require 'csv'

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

# ["Construção", "Alimentos", "Serviços Industrial de Utilidade Pública", "Derivados de Petróleo e Biocomustíveis", "Químicos", "Metalurgia", "Farmacêutico"].each do |descricao|
#   Setor.create(descricao: descricao)
# end

puts "#Clientes"
FactoryBot.create_list(:cliente, 5)

puts "#Produtos"
FactoryBot.create_list(:produto, 25)

puts "#Representantes"
FactoryBot.create_list(:representante, 50)

puts "#Lojistas"
FactoryBot.create_list(:lojista, 250)

puts "#Solicitações e Pedidos"
FactoryBot.create_list(:solicitacao, 500, :com_pedido)
