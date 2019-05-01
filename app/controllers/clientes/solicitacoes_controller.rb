class Clientes::SolicitacoesController < ApplicationController
  before_action :set_solicitacao, only: [:show, :edit, :update, :destroy]
  before_action :set_cliente, only: [:index, :show, :edit, :update, :status]

  def index
    @solicitacoes = get_solicitacoes
  end

  def show
  end

  def edit
  end

  def status
    @solicitacao = Solicitacao.find(params[:solicitacao_id])
    @solicitacao.send(params[:status] + "!")
    respond_to do |format|
      format.html {redirect_to cliente_solicitacoes_path(@cliente), flash: {success: 'Solicitacão foi alterada com sucesso.'}}
    end
  end

  private

  def get_solicitacoes
    current_usuario.cliente.solicitacoes.where.not(status: :criado).order(created_at: :desc)
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
end
