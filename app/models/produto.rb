# == Schema Information
#
# Table name: produtos
#
#  id           :bigint(8)        not null, primary key
#  descricao    :string
#  preco        :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  industria_id :bigint(8)
#
# Indexes
#
#  index_produtos_on_industria_id  (industria_id)
#
# Foreign Keys
#
#  fk_rails_...  (industria_id => industrias.id)
#

class Produto < ApplicationRecord
  belongs_to :industria
  has_many :pedidos
  has_many :solicitacoes, through: :pedidos

  has_one_attached :foto

end
