class Representantes::SolicitacoesController < ApplicationController
  before_action :set_solicitacao, only: [:show, :edit, :update, :destroy]
  before_action :set_representante, only: [:index, :show, :create, :new, :edit, :update, :destroy, :status]
  before_action :set_clientes, only: [:new, :edit, :create]
  before_action :set_lojistas, only: [:new, :edit, :create]

  def index
    @solicitacoes = get_solicitacoes
  end

  def show
  end

  def new
    @solicitacao = Solicitacao.new
    build_pedido
  end

  def edit
    @produtos = @solicitacao.cliente.produtos
    build_pedido
  end

  def create
    @solicitacao = Solicitacao.new(solicitacao_params)
    @solicitacao.representante = current_usuario.representante

    respond_to do |format|
      if @solicitacao.save!
        format.html {redirect_to representante_solicitacao_path(@representante, @solicitacao), flash: {success: 'Solicitação foi criada com sucesso.'}}
      else
        format.html {render :new}
      end
    end
  end

  def update
    @produtos = @solicitacao.cliente.produtos

    respond_to do |format|
      if @solicitacao.update(solicitacao_params)
        format.html {redirect_to representante_solicitacao_path(@representante, @solicitacao), flash: {success: 'Solicitação foi alterada com sucesso.'}}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @solicitacao.destroy
    respond_to do |format|
      format.html {redirect_to representante_solicitacoes_path(@representante), flash: {success: 'Solicitação foi excluida com sucesso.'}}
    end
  end

  def status
    solicitacao = Solicitacao.find(params[:solicitacao_id])
    solicitacao.send(params[:status] + "!")
    respond_to do |format|
      format.html {redirect_to representante_solicitacoes_path(@representante), flash: {success: 'Solicitação foi alterada com sucesso.'}}
    end
  end

  private

  def get_solicitacoes
    current_usuario.representante.solicitacoes
  end

  def build_pedido
    @solicitacao.pedidos.build
  end

  def set_solicitacao
    @solicitacao = Solicitacao.find(params[:id])
  end

  def set_clientes
    @clientes = current_usuario.representante.clientes
  end

  def set_lojistas
    @lojistas = current_usuario.representante.lojistas
  end

  def set_representante
    @representante = Representante.friendly.find(params[:representante_id])
  end

  def solicitacao_params
    params.require(:solicitacao).permit(:representante_id, :cliente_id, :lojista_id, pedidos_attributes: [:id, :quantidade, :produto_id, :_destroy])
  end
end
