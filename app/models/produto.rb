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
# Foreign Keys
#
#  fk_rails_...  (industria_id => industrias.id)
#

class Produto < ApplicationRecord
  acts_as_paranoid
  belongs_to :industria, optional: true
  has_many :pedidos
  has_many :solicitacoes, through: :pedidos

  has_one_attached :foto

  #TODO: Refactoring código duplicado
  #TODO: Mover para model concerns
  def solicitado?
    self.solicitacoes.any?
  end

end
