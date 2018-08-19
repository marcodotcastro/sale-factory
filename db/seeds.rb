require 'csv'


puts "IMPORTING REPRESENTATIVE"
CSV.foreach("spec/files/representantes.csv", headers: :true) do |row|
  Representative.create(row.to_hash)
end

puts "IMPORTING SHOPKEEPER"
CSV.foreach("spec/files/lojistas.csv", headers: :true) do |row|
  Shopkeeper.create(row.to_hash)
end