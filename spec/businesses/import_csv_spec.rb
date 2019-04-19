require 'rails_helper'
require 'csv'


RSpec.describe "ImportCsv" do

  xit "representantes" do

    CSV.foreach("spec/files/representantes.csv", headers: :true) do |row|
      Representante.create(row.to_hash.each_value(&:strip))
    end

    # expect(Representante.last.latitude).to eq(-21.7882576)
    # expect(Representante.last.longitude).to eq(-43.3652338)
  end

  xit "lojistas" do

    CSV.foreach("spec/files/lojistas.csv", headers: :true) do |row|
      Lojista.create(row.to_hash.each_value(&:strip))
    end

    # expect(Lojista.last.latitude).to eq(-21.7882576)
    # expect(Lojista.last.longitude).to eq(-43.3652338)
  end

  it "Cidade" do

    CSV.foreach("spec/files/cidades.csv", headers: :true) do |row|
      data = row.to_hash
      if data["estado"].eql? "GO"
        cidade = Cidade.new
        cidade.estado = data["estado"]
        cidade.codigo = data["codigo"]
        cidade.descricao = data["descricao"]
        cidade.populacao = data["populacao"].sub(".", "").to_i
        cidade.save
      end
    end

    expect(Cidade.count).to eq(246)
  end

end
