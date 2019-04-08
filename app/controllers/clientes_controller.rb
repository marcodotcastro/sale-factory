# == Schema Information
#
# Table name: clientes
#
#  id         :bigint(8)        not null, primary key
#  cep        :string
#  contato    :string
#  descricao  :string
#  endereco   :string
#  latitude   :float
#  longitude  :float
#  setor      :string
#  telefone   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cidade_id  :bigint(8)
#
# Indexes
#
#  index_clientes_on_cidade_id  (cidade_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#

class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]

  def index
    @clientes = Cliente.all
  end

  def show
    @representante_comerciais = @cliente.representante_comerciais
  end

  def new
    @cliente = Cliente.new
  end

  def edit
  end

  def create
    @cliente = Cliente.new(cliente_params)

    respond_to do |format|
      if @cliente.save
        format.html {redirect_to @cliente, notice: 'Cliente was successfully created.'}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html {redirect_to @cliente, notice: 'Cliente was successfully updated.'}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @cliente.destroy
    respond_to do |format|
      format.html {redirect_to clientes_url, notice: 'Cliente was successfully destroyed.'}
    end
  end

  private

  def set_cliente
    @cliente = Cliente.find(params[:id])
  end

  def cliente_params
    params.require(:cliente).permit(:descricao, :contato, :endereco, :cep, :telefone, :latitude, :longitude, :cidade_id)
  end
end