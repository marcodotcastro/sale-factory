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

class Representantes::IndustriasController < ApplicationController
  before_action :set_industria, only: [:show]
  before_action :set_representante, only: [:index, :show]
  before_action :get_cidades, only: [:index]
  before_action :get_estados, only: [:index]

  def index
    @industrias = get_industrias.result(distinct: true).page(params[:page_industria])
  end

  def show
    @lojistas = set_lojistas_do_industria_com_representante.page(params[:page_lojista])
    @produtos = @industria.produtos.page(params[:page_produto])
  end

  private

  def set_lojistas_do_industria_com_representante
    Lojista.joins(industrias: [:representantes]).where("representantes.id = #{@representante.id} and industrias.id = #{@industria.id}").distinct
  end

  def get_industrias
    @q = current_usuario.representante.industrias.ransack(params[:q])
  end

  def set_industria
    @industria = Industria.friendly.find(params[:id])
  end

  def set_representante
    @representante = current_usuario.representante
  end

  def get_cidades
    @cidades = Cidade.joins(industrias: [:representantes]).where("representantes.id = #{current_usuario.representante.id}").distinct
  end

  def get_estados
    @estados = Cidade.joins(industrias: [:representantes]).where("representantes.id = #{current_usuario.representante.id}").select(:estado).distinct
  end

end
