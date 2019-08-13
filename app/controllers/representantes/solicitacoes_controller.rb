class Representantes::SolicitacoesController < ApplicationController
  before_action :set_solicitacao, only: [:show, :edit, :update, :destroy]
  before_action :set_representante, only: [:index, :show, :create, :new, :edit, :update, :destroy, :status]
  before_action :set_industrias, only: [:new, :edit, :create, :index]
  before_action :set_lojistas, only: [:new, :edit, :create]
  before_action :get_lojistas, only: [:index]
  before_action :get_statuses, only: [:index]

  def index
    @solicitacoes = get_solicitacoes.result(distinct: true).page(params[:page_solicitacao])
  end

  def show
    @pedidos = @solicitacao.pedidos.order(id: :asc).page(params[:page_pedido])
    @comentarios = @solicitacao.comentarios.order(descricao: :asc).page(params[:page_comentarioT])
  end

  def new
    @solicitacao = Solicitacao.new
    build_pedido
  end

  def edit
    @produtos = @solicitacao.industria.produtos.order(descricao: :asc)
    build_pedido
  end

  def create
    @solicitacao = Solicitacao.new(solicitacao_params)
    @solicitacao.representante = current_usuario.representante

    respond_to do |format|
      if @solicitacao.save
        format.html {redirect_to representante_solicitacao_path(@representante, @solicitacao), flash: {success: 'Solicitação foi criada com sucesso.'}}
      else
        format.html {render :new}
      end
    end
  end

  def update
    @produtos = @solicitacao.industria.produtos.order(descricao: :asc)

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
    @solicitacao = Solicitacao.find(params[:solicitacao_id])
    @solicitacao.send(params[:status] + "!")
    respond_to do |format|
      format.html {redirect_to representante_solicitacao_path(@representante, @solicitacao), flash: {success: 'Solicitação foi alterada com sucesso.'}}
    end
  end

  private

  def get_solicitacoes
    @q = current_usuario.representante.solicitacoes.order(created_at: :desc).ransack(params[:q])
  end

  def build_pedido
    @solicitacao.pedidos.build
  end

  def set_solicitacao
    @solicitacao = Solicitacao.find(params[:id])
  end

  def set_industrias
    @industrias = current_usuario.representante.industrias.order(descricao: :asc)
  end

  def set_lojistas
    @lojistas = current_usuario.representante.lojistas.order(descricao: :asc)
  end

  def set_representante
    @representante = Representante.friendly.find(params[:representante_id])
  end

  def get_statuses
    @statuses = Solicitacao.where("representante_id = #{@representante.id}").select(:status).distinct.order(status: :asc)
  end

  def get_lojistas
    @lojistas = Lojista.joins(:solicitacoes).where("solicitacoes.representante_id = #{current_usuario.representante.id}").distinct.order(descricao: :asc)
  end

  def solicitacao_params
    params.require(:solicitacao).permit(:representante_id, :industria_id, :lojista_id, pedidos_attributes: [:id, :quantidade, :produto_id, :_destroy])
  end
end
