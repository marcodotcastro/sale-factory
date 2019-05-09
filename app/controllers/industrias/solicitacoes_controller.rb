class Industrias::SolicitacoesController < ApplicationController
  before_action :set_solicitacao, only: [:show, :edit, :update, :destroy]
  before_action :set_industria, only: [:index, :show, :edit, :update, :status]
  before_action :get_lojistas, only: [:index]
  before_action :get_statuses, only: [:index]
  before_action :get_representantes, only: [:index]

  def index
    @solicitacoes = get_solicitacoes.result(distinct: true).page(params[:page_solicitacao])
  end

  def show
    @pedidos = @solicitacao.pedidos.order(id: :asc).page(params[:page_pedido])
    @comentarios = @solicitacao.comentarios.order(descricao: :asc).page(params[:page_comentario])
  end

  def edit
  end

  def status
    @solicitacao = Solicitacao.find(params[:solicitacao_id])
    @solicitacao.send(params[:status] + "!")
    respond_to do |format|
      format.html {redirect_to industria_solicitacao_path(@industria, @solicitacao), flash: {success: 'Solicitacão foi alterada com sucesso.'}}
    end
  end

  private

  def get_solicitacoes
    @q = current_usuario.industria.solicitacoes.where.not(status: :criado).order(created_at: :desc).ransack(params[:q])
  end

  def set_solicitacao
    @solicitacao = Solicitacao.find(params[:id])
  end

  def set_industria
    @industria = Industria.friendly.find(params[:industria_id])
  end

  def solicitacao_params
    params.require(:solicitacao).permit(:status)
  end

  def get_statuses
    @statuses = Solicitacao.where("industria_id = #{current_usuario.industria.id}").select(:status).where.not(status: :criado).distinct.order(status: :asc)
  end

  def get_representantes
    @representantes = Representante.joins(:solicitacoes, :industrias).where("solicitacoes.industria_id = #{current_usuario.industria.id}").distinct.order(descricao: :asc)
  end

  def get_lojistas
    @lojistas = Lojista.joins(:solicitacoes, representantes: [:industrias]).where("solicitacoes.industria_id = #{current_usuario.industria.id}").distinct.order(descricao: :asc)
  end

end
