class Representantes::ProdutosController < ApplicationController
  before_action :set_produto, only: [:show]
  before_action :set_representante, only: [:index, :show]
  before_action :get_industrias, only: [:index]

  def index
    @produtos = set_produtos_dos_industrias_do_representante.result(distinct: true).page(params[:page_produto])
  end

  def show
  end

  private

  def set_produtos_dos_industrias_do_representante
    @q = Produto.ativos.joins(industria: [:representantes]).where("representantes.id = #{@representante.id}").ransack(params[:q])
  end

  def set_produto
    @produto = Produto.find(params[:id])
  end

  def set_representante
    @representante = current_usuario.representante
  end

  def get_industrias
    @industrias = current_usuario.representante.industrias.order(descricao: :asc)
  end

end
