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
#  representante_id :bigint(8)
#
# Indexes
#
#  index_lojistas_on_cidade_id                   (cidade_id)
#  index_lojistas_on_representante_id  (representante_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#  fk_rails_...  (representante_id => representantes.id)
#

class Representantes::LojistasController < ApplicationController
  before_action :set_lojista, only: [:show, :edit, :update, :destroy]
  before_action :set_representante, only: [:index, :show, :create, :new, :edit, :update, :destroy]
  before_action :set_clientes, only: [:new, :edit]
  before_action :get_cidades, only: [:index]
  before_action :get_estados, only: [:index]

  def index
    @lojistas = get_lojistas.result(distinct: true).page(params[:page])
  end

  def show
    @clientes = set_clientes_do_lojista_com_representante
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
        @lojista.representantes << @representante
        format.html {redirect_to representante_lojista_path(@representante, @lojista), flash: {success: 'Lojista foi criado com sucesso.'}}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @lojista.update(lojista_params)
        format.html {redirect_to representante_lojista_path(@representante, @lojista), flash: {success: 'Lojista foi alterado com sucesso.'}}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @lojista.destroy
    respond_to do |format|
      format.html {redirect_to representante_lojistas_path(@representante), flash: {success: 'Lojista foi excluido com sucesso.'}}
    end
  end

  private

  def set_clientes
    @clientes = current_usuario.representante.clientes
  end

  def set_clientes_do_lojista_com_representante
    Cliente.joins(lojistas: [:representantes]).where("representantes.id = #{@representante.id} and lojistas.id = #{@lojista.id}").distinct
  end

  def get_lojistas
    @q = current_usuario.representante.lojistas.ransack(params[:q])
  end

  def set_lojista
    @lojista = Lojista.friendly.find(params[:id])
  end

  def set_representante
    @representante = Representante.friendly.find(params[:representante_id])
  end

  def lojista_params
    params.require(:lojista).permit(:logo, :descricao, :endereco, :contato, :telefone, :telefone_whatsapp, :email, :cep, :latitude, :longitude, :representante_id, :cidade_id, cliente_ids: [])
  end

  def get_cidades
    @cidades = Cidade.joins(lojistas: [:representantes]).where("representantes.id = #{current_usuario.representante.id}").distinct
  end

  def get_estados
    @estados = Cidade.joins(lojistas: [:representantes]).where("representantes.id = #{current_usuario.representante.id}").select(:estado).distinct
  end

end
