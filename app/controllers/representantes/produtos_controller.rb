class Representantes::ProdutosController < ApplicationController
  before_action :set_produto, only: [:show]
  before_action :set_representante, only: [:index, :show]
  before_action :get_clientes, only: [:index]

  def index
    @produtos = set_produtos_dos_clientes_do_representante.result(distinct: true)
  end

  def show
  end

  private

  def set_produtos_dos_clientes_do_representante
    @q = Produto.joins(cliente: [:representantes]).where("representantes.id = #{@representante.id}").ransack(params[:q])
  end

  def set_produto
    @produto = Produto.find(params[:id])
  end

  def set_representante
    @representante = current_usuario.representante
  end

  def get_clientes
    @clientes = current_usuario.representante.clientes
  end

end
