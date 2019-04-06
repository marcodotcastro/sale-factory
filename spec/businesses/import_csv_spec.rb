require 'rails_helper'
require 'csv'


RSpec.describe "ImportCsv" do

  xit "representantes" do

    CSV.foreach("spec/files/representantes.csv", headers: :true) do |row|
      RepresentanteComercial.create(row.to_hash.each_value(&:strip))
    end

    # expect(RepresentanteComercial.last.latitude).to eq(-21.7882576)
    # expect(RepresentanteComercial.last.longitude).to eq(-43.3652338)
  end

  xit "lojistas" do

    CSV.foreach("spec/files/lojistas.csv", headers: :true) do |row|
      Lojista.create(row.to_hash.each_value(&:strip))
    end

    # expect(Lojista.last.latitude).to eq(-21.7882576)
    # expect(Lojista.last.longitude).to eq(-43.3652338)
  end

  xit "import" do

    CSV.foreach("spec/files/cidades.csv", headers: :true) do |row|
      Cidade.create(row.to_hash.each_value(&:strip))
    end

    # expect(Lojista.last.latitude).to eq(-21.7882576)
    # expect(Lojista.last.longitude).to eq(-43.3652338)
  end

end
