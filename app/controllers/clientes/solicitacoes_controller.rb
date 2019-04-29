class Clientes::SolicitacoesController < ApplicationController
  before_action :set_solicitacao, only: [:show, :edit, :update, :destroy]
  before_action :set_cliente, only: [:index, :show, :edit, :update]

  def index
    @solicitacoes = get_solicitacoes
  end

  def show
  end

  def edit
  end

  def update
    if solicitacao_params[:status].eql? "cancelar"
      @solicitacao.cancelar
    end

    respond_to do |format|
      if @solicitacao.save
        format.html {redirect_to cliente_solicitacao_path(@cliente, @solicitacao), flash: {success: 'Pedidos was successfully updated.'}}
      else
        format.html {render :edit}
      end
    end
  end

  private

  def get_solicitacoes
    current_usuario.cliente.solicitacoes.where.not(status: :criado)
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
