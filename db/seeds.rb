require 'csv'


puts "IMPORTING REPRESENTATIVE"
CSV.foreach("spec/files/representantes.csv", headers: :true) do |row, index|
  representative = Representative.create(row.to_hash.each_value(&:strip!))
  puts "#{$.} - latitude:#{representative.latitude}, longitude:#{representative.longitude}, cep:#{representative.cep}"
  puts row.to_hash.each_value(&:strip!)
end

puts "IMPORTING SHOPKEEPER"
CSV.foreach("spec/files/lojistas.csv", headers: :true) do |row, index|
  shopkeeper = Shopkeeper.create(row.to_hash.each_value(&:strip!))
  puts "#{$.} - latitude:#{shopkeeper.latitude}, longitude:#{shopkeeper.longitude}, cep:#{shopkeeper.cep}"
  puts row.to_hash.each_value(&:strip!)
end