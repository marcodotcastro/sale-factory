class Clientes::ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]
  before_action :set_cliente, only: [:index, :show, :create, :new, :edit, :update, :destroy]
  before_action :set_produtos, only: [:new, :edit]

  def index
    @produtos = get_produtos
  end

  def show
    @produtos = @cliente.produtos
  end

  def new
    @produto = Produto.new
  end

  def edit
  end

  def create
    @produto = Produto.new(produto_params)
    @produto.cliente = @cliente

    respond_to do |format|
      if @produto.save
        format.html {redirect_to cliente_produto_path(@cliente, @produto), flash: {success: 'Produto was successfully created.'}}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @produto.update(produto_params)
        format.html {redirect_to cliente_produto_path(@cliente, @produto), flash: {success: 'Produto was successfully updated.'}}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @produto.destroy
    respond_to do |format|
      format.html {redirect_to cliente_produtos_path(@cliente), flash: {success: 'Produto was successfully destroyed.'}}
    end
  end

  private

  def set_produtos
    @produtos = current_usuario.cliente.produtos
  end

  def get_produtos
    current_usuario.cliente.produtos
  end

  def set_produto
    @produto = Produto.find(params[:id])
  end

  def set_cliente
    @cliente = Cliente.friendly.find(params[:cliente_id])
  end

  def produto_params
    params.require(:produto).permit(:descricao, :preco)
  end
end