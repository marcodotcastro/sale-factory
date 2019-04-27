class Representantes::SolicitacoesController < ApplicationController
  before_action :set_solicitacao, only: [:show, :edit, :update, :destroy]
  before_action :set_representante, only: [:index, :show, :create, :new, :edit, :update, :destroy]
  before_action :set_clientes, only: [:new, :edit, :create]

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
    build_pedido
  end

  def create
    @solicitacao = Solicitacao.new(solicitacao_params)
    @solicitacao.representante = current_usuario.representante

    respond_to do |format|
      if @solicitacao.save
        format.html {redirect_to representante_solicitacao_path(@representante, @solicitacao), flash: {success: 'Solicitacao was successfully created.'}}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @solicitacao.update(solicitacao_params)
        format.html {redirect_to representante_solicitacao_path(@representante, @solicitacao), flash: {success: 'Solicitacao was successfully updated.'}}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @solicitacao.destroy
    respond_to do |format|
      format.html {redirect_to representante_solicitacoes_path(@representante), flash: {success: 'Solicitacao was successfully destroyed.'}}
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

  def set_representante
    @representante = Representante.friendly.find(params[:representante_id])
  end

  def solicitacao_params
    params.require(:solicitacao).permit(:representante_id, :cliente_id, pedidos_attributes: [:id, :quantidade, :produto_id, :_destroy])
  end
end
