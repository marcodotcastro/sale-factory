# == Schema Information
#
# Table name: representantes
#
#  id                :bigint(8)        not null, primary key
#  cep               :string
#  contato           :string
#  deleted_at        :datetime
#  descricao         :string
#  email             :string
#  endereco          :string
#  latitude          :float
#  longitude         :float
#  telefone          :string
#  telefone_whatsapp :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  cidade_id         :bigint(8)
#  usuario_id        :bigint(8)
#
# Indexes
#
#  index_representantes_on_cidade_id   (cidade_id)
#  index_representantes_on_deleted_at  (deleted_at)
#  index_representantes_on_usuario_id  (usuario_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#

class Clientes::RepresentantesController < ApplicationController
  before_action :set_representante, only: [:show]
  before_action :set_cliente, only: [:index, :show]

  def index
    @representantes = current_usuario.cliente.representantes
  end

  def show
    @lojistas = current_usuario.cliente.lojistas
  end

  private

  def set_cliente
    @cliente = current_usuario.cliente
  end

  def set_representante
    @representante = current_usuario.cliente.representantes.find(params[:id])
  end

  def representante_params
    params.require(:representante).permit(:cliente_id)
  end
end
