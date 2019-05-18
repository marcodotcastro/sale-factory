# == Schema Information
#
# Table name: produtos
#
#  id           :bigint(8)        not null, primary key
#  deleted_at   :datetime
#  descricao    :string
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
    descricao {FFaker::Product.product_name}
    preco {Faker::Number.decimal(3)}

    after(:create) do |produto|
      produto.foto.attach(io: File.open(Rails.root.join("spec", "files", "logos", "produto-foto-#{rand(1..5)}.jpg")), filename: "produto-foto-#{rand(1..5)}.jpg", content_type: "image/jpeg")
    end

    before(:create) do |produto|
      produto.industria = Industria.all.sample
    end


  end
end
