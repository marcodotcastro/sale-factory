# == Schema Information
#
# Table name: lojistas
#
#  id                         :bigint(8)        not null, primary key
#  cep                        :string
#  contato                    :string
#  descricao                  :string
#  email                      :string
#  endereco                   :string
#  latitude                   :float
#  longitude                  :float
#  telefone                   :string
#  telefone_whatsapp          :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  cidade_id                  :bigint(8)
#  representante_comercial_id :bigint(8)
#
# Indexes
#
#  index_lojistas_on_cidade_id                   (cidade_id)
#  index_lojistas_on_representante_comercial_id  (representante_comercial_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#  fk_rails_...  (representante_comercial_id => representante_comerciais.id)
#

class RepresentanteComerciais::LojistasController < ApplicationController
  before_action :set_lojista, only: [:show, :edit, :update, :destroy]
  before_action :set_representante_comercial, only: [:index, :show, :create, :edit, :update, :destroy]
  before_action :set_cliente, only: [:index, :show, :edit, :create, :update, :destroy]

  def index
    @lojistas = Lojista.all
  end

  def show
  end

  def new
    @lojista = Lojista.new
  end

  def edit
  end

  def create
    @lojista = Lojista.new(lojista_params)

    respond_to do |format|
      if @lojista.save
        format.html {redirect_to cliente_representante_comercial_lojista_path(@cliente, @representante_comercial, @lojista), flash: {success: 'Lojista was successfully created.'}}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @lojista.update(lojista_params)
        format.html {redirect_to cliente_representante_comercial_lojista_path(@cliente, @representante_comercial, @lojista), flash: {success: 'Lojista was successfully updated.'}}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @lojista.destroy
    respond_to do |format|
      format.html {redirect_to cliente_representante_comercial_lojistas_path(@cliente, @representante_comercial), flash: {success: 'Lojista was successfully destroyed.'}}
    end
  end

  private

  def set_lojista
    @lojista = Lojista.find(params[:id])
  end

  def set_representante_comercial
    @representante_comercial = RepresentanteComercial.find(params[:representante_comercial_id])
  end

  def set_cliente
    @cliente = Cliente.find(params[:cliente_id])
  end

  def lojista_params
    params.require(:lojista).permit(:nome, :endereco, :telefone, :cep, :latitude, :longitude, :cliente_id, :representante_comercial_id, :cidade_id)
  end
end
