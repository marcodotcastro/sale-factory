require 'csv'


CSV.foreach("spec/files/representantes.csv", headers: :true) do |row|
  Representative.create(row.to_hash)
end
