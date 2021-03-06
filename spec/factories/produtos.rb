# == Schema Information
#
# Table name: produtos
#
#  id           :bigint(8)        not null, primary key
#  ativo        :boolean
#  codigo       :string
#  deleted_at   :datetime
#  descricao    :string
#  detalhe      :text
#  preco        :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  industria_id :bigint(8)
#
# Indexes
#
#  index_produtos_on_deleted_at    (deleted_at)
#  index_produtos_on_industria_id  (industria_id)
#

FactoryBot.define do
  factory :produto do
    codigo {FFaker::Product.model}
    descricao {FFaker::Product.product_name}
    preco {Faker::Number.decimal(3)}
    detalhe {FFaker::Lorem.paragraph}

    after(:create) do |produto|
      produto.foto.attach(io: File.open(Rails.root.join("spec", "files", "logos", "produto-foto-#{rand(1..5)}.jpg")), filename: "produto-foto-#{rand(1..5)}.jpg", content_type: "image/jpeg")

      rand(2..3).times do
        produto.arquivos.attach(io: File.open(Rails.root.join("spec", "files", "folders", "folder-#{rand(1..3)}.pdf")), filename: "folder-#{rand(1..3)}.pdf", content_type: "application/pdf")
      end

      produto.update(ativo: [true, false].sample)
    end

    before(:create) do |produto|
      produto.industria = Industria.all.sample
    end


  end
end
