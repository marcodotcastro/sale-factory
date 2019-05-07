class Clientes::SolicitacoesController < ApplicationController
  before_action :set_solicitacao, only: [:show, :edit, :update, :destroy]
  before_action :set_cliente, only: [:index, :show, :edit, :update, :status]
  before_action :get_lojistas, only: [:index]
  before_action :get_statuses, only: [:index]
  before_action :get_representantes, only: [:index]

  def index
    @solicitacoes = get_solicitacoes.result(distinct: true)
  end

  def show
  end

  def edit
  end

  def status
    @solicitacao = Solicitacao.find(params[:solicitacao_id])
    @solicitacao.send(params[:status] + "!")
    respond_to do |format|
      format.html {redirect_to cliente_solicitacao_path(@cliente, @solicitacao), flash: {success: 'Solicitacão foi alterada com sucesso.'}}
    end
  end

  private

  def get_solicitacoes
    @q = current_usuario.cliente.solicitacoes.where.not(status: :criado).order(created_at: :desc).ransack(params[:q])
  end

  def set_solicitacao
    @solicitacao = Solicitacao.find(params[:id])
  end

  def set_cliente
    @cliente = Cliente.friendly.find(params[:cliente_id])
  end

  def solicitacao_params
    params.require(:solicitacao).permit(:status)
  end

  def get_statuses
    @statuses = Solicitacao.select(:status).where.not(status: :criado).distinct
  end

  def get_representantes
    @representantes = Representante.joins(:solicitacoes).where("solicitacoes.cliente_id = #{current_usuario.cliente.id}").distinct
  end

  def get_lojistas
    @lojistas = Lojista.joins(:solicitacoes).where("solicitacoes.cliente_id = #{current_usuario.cliente.id}").distinct
  end

end
