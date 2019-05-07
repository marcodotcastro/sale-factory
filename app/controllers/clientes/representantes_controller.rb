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
  before_action :set_cliente, only: [:index, :show, :desvincular]
  before_action :get_cidades, only: [:index]
  before_action :get_estados, only: [:index]

  def index
    @representantes = get_representantes.result(distinct: true)
  end

  def show
    @lojistas = get_lojistas
  end

  def desvincular
    representante = get_representantes.friendly.find(params[:representante_id])
    get_representantes.delete(representante)

    respond_to do |format|
      format.html {redirect_to cliente_representantes_path(@cliente), flash: {success: 'Representante foi excluido com sucesso.'}}
    end
  end

  private

  def get_lojistas
    current_usuario.cliente.lojistas
  end

  def get_representantes
    @q = current_usuario.cliente.representantes.ransack(params[:q])
  end

  def set_cliente
    @cliente = current_usuario.cliente
  end

  def set_representante
    @representante = current_usuario.cliente.representantes.friendly.find(params[:id])
  end

  def representante_params
    params.require(:representante).permit(:cliente_id)
  end

  def get_cidades
    @cidades = Cidade.joins(representantes: :clientes).where("clientes.id = #{current_usuario.cliente.id}").distinct
  end

  def get_estados
    @estados = Cidade.joins(representantes: :clientes).where("clientes.id = #{current_usuario.cliente.id}").select(:estado).distinct
  end


end
