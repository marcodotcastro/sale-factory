# == Schema Information
#
# Table name: assinaturas
#
#  id         :bigint(8)        not null, primary key
#  ativo      :boolean
#  periodo    :integer
#  validade   :date
#  valor      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  plano_id   :bigint(8)
#  usuario_id :bigint(8)
#
# Indexes
#
#  index_assinaturas_on_plano_id    (plano_id)
#  index_assinaturas_on_usuario_id  (usuario_id)
#
# Foreign Keys
#
#  fk_rails_...  (plano_id => planos.id)
#  fk_rails_...  (usuario_id => usuarios.id)
#

class Assinatura < ApplicationRecord
  belongs_to :usuario
  belongs_to :plano

  before_create :ativar

  validates_presence_of :plano_id

  private

  def ativar
    #TODO: Consultar Assinatura no Gateway
    self.ativo = true
  end


end