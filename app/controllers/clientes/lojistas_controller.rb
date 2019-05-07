# == Schema Information
#
# Table name: lojistas
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
#
# Indexes
#
#  index_lojistas_on_cidade_id   (cidade_id)
#  index_lojistas_on_deleted_at  (deleted_at)
#

class Clientes::LojistasController < ApplicationController
  before_action :set_lojista, only: [:show]
  before_action :set_cliente, only: [:index, :show]
  before_action :get_cidades, only: [:index]
  before_action :get_estados, only: [:index]

  def index
    @lojistas = get_lojistas.result(distinct: true)
  end

  def show
  end

  private

  def get_lojistas
    @q = current_usuario.cliente.lojistas.ransack(params[:q])
  end

  def set_cliente
    @cliente = Cliente.friendly.find(params[:cliente_id])
  end

  def set_lojista
    @lojista = Lojista.friendly.find(params[:id])
  end

  def lojista_params
    params.require(:lojista).permit(:cliente_id)
  end

  def get_cidades
    @cidades = Cidade.joins(lojistas: [:clientes]).where("clientes.id = #{current_usuario.cliente.id}").distinct
  end

  def get_estados
    @estados = Cidade.joins(lojistas: [:clientes]).where("clientes.id = #{current_usuario.cliente.id}").select(:estado).distinct
  end

end
