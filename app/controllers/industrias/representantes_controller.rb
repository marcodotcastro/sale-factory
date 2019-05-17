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

class Industrias::RepresentantesController < ApplicationController
  before_action :set_representante, only: [:show]
  before_action :set_industria, only: [:index, :show, :desvincular]
  before_action :get_cidades, only: [:index]
  before_action :get_estados, only: [:index]

  def index
    @representantes = get_representantes.result(distinct: true).page(params[:page_representante])
  end

  def show
    @lojistas = get_lojistas.page(params[:page_lojista])
  end

  def desvincular
    representante = current_usuario.industria.representantes.friendly.find(params[:representante_id])

    respond_to do |format|
      unless representante.solicitacao_em_aberto
        if current_usuario.industria.representantes.delete(representante)
          format.html {redirect_to industria_representantes_path(@industria), flash: {success: 'Representante foi desvinculado com sucesso.'}}
        else
          format.html {redirect_to industria_representantes_path(@industria), flash: {error: 'Representante não foi desvinculado.'}}
        end
      else
        format.html {redirect_to industria_representante_path(@industria, representante), flash: {error: 'Representante não foi desvinculado, pois tem solicitações aberta.'}}
      end
    end
  end

  private

  def get_lojistas
    Lojista.joins(:representantes, :industrias).where("lojistas_representantes.representante_id = #{@representante.id} and industrias_lojistas.industria_id = #{current_usuario.industria.id}").order(descricao: :asc)
  end

  def get_representantes
    @q = current_usuario.industria.representantes.order(descricao: :asc).ransack(params[:q])
  end

  def set_industria
    @industria = current_usuario.industria
  end

  def set_representante
    @representante = Representante.friendly.find(params[:id])
  end

  def representante_params
    params.require(:representante).permit(:industria_id)
  end

  def get_cidades
    @cidades = Cidade.joins(representantes: :industrias).where("industrias.id = #{current_usuario.industria.id}").distinct.order(descricao: :asc)
  end

  def get_estados
    @estados = Cidade.joins(representantes: :industrias).where("industrias.id = #{current_usuario.industria.id}").select(:estado).distinct.order(estado: :asc)
  end


end
