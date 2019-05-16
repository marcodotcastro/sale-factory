require 'csv'

AdminUser.create!(email: 'admin@elevatesales.me', password: '12345678', password_confirmation: '12345678')

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
Plano.create(descricao: "10 Convites", numero_convites: 10, preco: 300)
Plano.create(descricao: "20 Convites", numero_convites: 20, preco: 600)
Plano.create(descricao: "30 Convites", numero_convites: 30, preco: 900)
Plano.create(descricao: "40 Convites", numero_convites: 40, preco: 1200)
Plano.create(descricao: "50 Convites", numero_convites: 50, preco: 1500)
Plano.create(descricao: "60 Convites", numero_convites: 60, preco: 1800)
Plano.create(descricao: "70 Convites", numero_convites: 70, preco: 2100)
Plano.create(descricao: "80 Convites", numero_convites: 80, preco: 2400)
Plano.create(descricao: "90 Convites", numero_convites: 90, preco: 2700)
Plano.create(descricao: "100 Convites", numero_convites: 100, preco: 3000)

if Rails.env.development?

  puts "#Industrias"
  FactoryBot.create_list(:industria, 5)

  puts "#Produtos"
  FactoryBot.create_list(:produto, 25)

  puts "#Representantes"
  FactoryBot.create_list(:representante, 50)

  puts "#Lojistas"
  FactoryBot.create_list(:lojista, 250)

  puts "#Solicitações e Pedidos"
  FactoryBot.create_list(:solicitacao, 500, :com_pedido)

end
