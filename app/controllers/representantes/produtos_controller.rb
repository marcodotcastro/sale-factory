class Representantes::ProdutosController < ApplicationController
  before_action :set_produto, only: [:show]
  before_action :set_representante, only: [:index, :show]

  def index
    @produtos = set_produtos_dos_clientes_do_representante
  end

  def show
  end

  private

  def set_produtos_dos_clientes_do_representante
    produtos = []
    @representante.clientes.each do |cliente|
      if cliente.representantes.find_by(id: @representante)
        cliente.produtos.each do |produto|
          produtos << produto
        end
      end
    end
    produtos
  end

  def set_produto
    @produto = Produto.find(params[:id])
  end

  def set_representante
    @representante = current_usuario.representante
  end

end
