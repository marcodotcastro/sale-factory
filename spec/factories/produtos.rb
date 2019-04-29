# == Schema Information
#
# Table name: produtos
#
#  id         :bigint(8)        not null, primary key
#  descricao  :string
#  preco      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cliente_id :bigint(8)
#
# Indexes
#
#  index_produtos_on_cliente_id  (cliente_id)
#
# Foreign Keys
#
#  fk_rails_...  (cliente_id => clientes.id)
#

FactoryBot.define do
  factory :produto do
    descricao {FFaker::Product.product_name}
    preco {Faker::Number.decimal(3)}
  end
end
