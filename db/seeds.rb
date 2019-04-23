require 'csv'

puts "Estados"
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

puts "Clientes, Representantes e Lojistas"
FactoryBot.create(:cliente, :com_representante, :com_representantes)

# ["Construção", "Alimentos", "Serviços Industrial de Utilidade Pública", "Derivados de Petróleo e Biocomustíveis", "Químicos", "Metalurgia", "Farmacêutico"].each do |descricao|
#   Setor.create(descricao: descricao)
# end

Usuario.where(tipo: :representante).each do |usuario|
  usuario.update(invited_by_id: Cliente.all.sample.id, invited_by_type: :cliente)
end

Cliente.all.each do |cidade|
  cidade.update(cidade_id: Cidade.all.sample.id)
end

Representante.all.each do |representante|
  representante.update(cidade_id: Cidade.all.sample.id)
end

Lojista.all.each do |lojista|
  lojista.update(cidade_id: Cidade.all.sample.id)
end
