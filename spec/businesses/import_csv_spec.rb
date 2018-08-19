require 'rails_helper'
require 'csv'


RSpec.describe "ImportCsv" do

  it "representantes" do

    CSV.foreach("spec/files/representantes.csv", headers: :true) do |row|
      Representative.create(row.to_hash.each_value(&:strip))
    end

    expect(Representative.last.latitude).to eq(-21.7882576)
    expect(Representative.last.longitude).to eq(-43.3652338)
  end

  it "import" do

    CSV.foreach("spec/files/lojistas.csv", headers: :true) do |row|
      Shopkeeper.create(row.to_hash.each_value(&:strip))
    end

    # expect(Shopkeeper.last.latitude).to eq(-21.7882576)
    # expect(Shopkeeper.last.longitude).to eq(-43.3652338)
  end

end
