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

  def index
    @lojistas = get_lojistas
  end

  def show
    @clientes = set_clientes_do_lojista_com_representante
  end

  private

  def set_clientes_do_lojista_com_representante
    #TODO: Como refatorar isso?
    clientes = []
    @lojista.clientes.each do |cliente|
      if cliente.representantes.find_by(id: @representante)
        clientes << cliente
      end
    end
  end

  def get_lojistas
    current_usuario.cliente.lojistas
  end

  def set_cliente
    @cliente = Cliente.find(params[:cliente_id])
  end

  def set_lojista
    @lojista = Lojista.find(params[:id])
  end

  def lojista_params
    params.require(:lojista).permit(:cliente_id)
  end
end
