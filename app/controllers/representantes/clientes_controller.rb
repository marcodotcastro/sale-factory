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

class Representantes::ClientesController < ApplicationController
  before_action :set_cliente, only: [:show]
  before_action :set_representante, only: [:index, :show]

  def index
    @clientes = current_usuario.representante.clientes
  end

  def show
    @lojistas = set_lojistas_do_cliente_com_representante
    @produtos = @cliente.produtos
  end

  private

  def set_lojistas_do_cliente_com_representante
    #TODO: Como refatorar isso?
    lojistas = []
    @cliente.lojistas.each do |lojista|
      if lojista.representantes.find_by(id: @representante)
        lojistas << lojista
      end
    end
  end

  def set_cliente
    @cliente = Cliente.friendly.find(params[:id])
  end

  def set_representante
    @representante = current_usuario.representante
  end

end
