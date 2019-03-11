require 'csv'

puts "Importing City"
CSV.foreach("spec/files/cidades.csv", headers: :true) do |row|
  city = City.where(description: row.to_hash["description"]).first_or_create(row.to_hash.each_value(&:strip!))
  puts "#{$.} - latitude:#{city.latitude}, longitude:#{city.longitude}, description:#{city.description}"
  puts row.to_hash.each_value(&:strip!)
end

puts "Importing Representative"
CSV.foreach("spec/files/representantes.csv", headers: :true) do |row|
  representative = Representative.where(cep: row.to_hash["cep"]).first_or_create(row.to_hash.each_value(&:strip!))
  puts "#{$.} - latitude:#{representative.latitude}, longitude:#{representative.longitude}, cep:#{representative.cep}"
  puts row.to_hash.each_value(&:strip!)
end

puts "Importing Shopkeeper"
CSV.foreach("spec/files/lojistas.csv", headers: :true) do |row|
  shopkeeper = Shopkeeper.where(cep: row.to_hash["cep"]).first_or_create(row.to_hash.each_value(&:strip!))
  puts "#{$.} - latitude:#{shopkeeper.latitude}, longitude:#{shopkeeper.longitude}, cep:#{shopkeeper.cep}"
  puts row.to_hash.each_value(&:strip!)
end