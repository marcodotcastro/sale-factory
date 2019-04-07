# == Schema Information
#
# Table name: representante_comerciais
#
#  id         :bigint(8)        not null, primary key
#  cep        :string
#  contato    :string
#  descricao  :string
#  email      :string
#  endereco   :string
#  latitude   :float
#  longitude  :float
#  telefone   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cidade_id  :bigint(8)
#  cliente_id :bigint(8)
#
# Indexes
#
#  index_representante_comerciais_on_cidade_id   (cidade_id)
#  index_representante_comerciais_on_cliente_id  (cliente_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#  fk_rails_...  (cliente_id => clientes.id)
#

class RepresentanteComerciaisController < ApplicationController
  before_action :set_representante_comercial, only: [:show, :edit, :update, :destroy]
  before_action :set_cliente, only: [:index, :show, :edit, :create, :update, :destroy]

  def index
    @representante_comerciais = @cliente.representante_comerciais
  end

  def show
    @lojistas = @representante_comercial.lojistas
  end

  def new
    @representante_comercial = RepresentanteComercial.new
  end

  def edit
  end

  def create
    @representante_comercial = RepresentanteComercial.new(representante_comercial_params)

    respond_to do |format|
      if @representante_comercial.save
        format.html {redirect_to cliente_representante_comercial_path(@cliente, @representante_comercial), notice: 'Representante comercial was successfully created.'}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @representante_comercial.update(representante_comercial_params)
        format.html {redirect_to cliente_representante_comercial_path(@cliente, @representante_comercial), notice: 'Representante comercial was successfully updated.'}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @representante_comercial.destroy
    respond_to do |format|
      format.html {redirect_to cliente_representante_comerciais_path(@cliente), notice: 'Representante comercial was successfully destroyed.'}
    end
  end

  private

  def set_cliente
    @cliente = Cliente.find(params[:cliente_id])
  end

  def set_representante_comercial
    @representante_comercial = RepresentanteComercial.find(params[:id])
  end

  def representante_comercial_params
    params.require(:representante_comercial).permit(:descricao, :contato, :endereco, :cep, :telefone, :email, :latitude, :longitude, :cliente_id, :cidade_id)
  end
end
