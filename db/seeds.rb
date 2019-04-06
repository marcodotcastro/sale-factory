require 'csv'

# puts "Importando Cidade"
# CSV.foreach("spec/files/cidades.csv", headers: :true) do |row|
#   city = Cidade.where(descricao: row.to_hash["description"]).first_or_create(row.to_hash.each_value(&:strip!))
#   puts "#{$.} - latitude:#{city.latitude}, longitude:#{city.longitude}, description:#{city.descricao}"
#   puts row.to_hash.each_value(&:strip!)
# end

FactoryBot.create(:representante_comercial, :com_lojistas)
