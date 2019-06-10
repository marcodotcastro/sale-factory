class Industrias::ProdutosController < ApplicationController
  before_action :set_produto, only: [:show, :edit, :update, :destroy]
  before_action :set_industria, only: [:index, :show, :create, :new, :edit, :update, :destroy]
  before_action :set_produtos, only: [:new, :edit]

  def index
    @produtos = get_produtos.result(distinct: true).page(params[:page_produto])
  end

  def show
    @produtos = @industria.produtos.order(descricao: :asc).page(params[:page_produto])
  end

  def new
    @produto = Produto.new
  end

  def edit
  end

  def create
    @produto = Produto.new(produto_params)
    @produto.industria = @industria

    respond_to do |format|
      if @produto.save
        format.html {redirect_to industria_produto_path(@industria, @produto), flash: {success: 'Produto foi criado com sucesso.'}}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @produto.update(produto_params)
        format.html {redirect_to industria_produto_path(@industria, @produto), flash: {success: 'Produto foi alterado com sucesso.'}}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    respond_to do |format|
      unless @produto.solicitado?
        if @produto.really_destroy!
          format.html {redirect_to industria_produtos_path(@industria), flash: {success: 'Produto foi excluido com sucesso.'}}
        else
          format.html {redirect_to industria_produtos_path(@industria), flash: {erro: 'Produto não foi excluido com sucesso.'}}
        end
      else
        if @produto.destroy
          format.html {redirect_to industria_produtos_path(@industria), flash: {success: 'Produto foi excluido com sucesso.'}}
        else
          format.html {redirect_to industria_produtos_path(@industria), flash: {erro: 'Produto não foi excluido com sucesso.'}}
        end
      end
    end
  end

  private

  def set_produtos
    @produtos = get_produtos
  end

  def get_produtos
    @q = current_usuario.industria.produtos.order(descricao: :asc).ransack(params[:q])
  end

  def set_produto
    @produto = Produto.with_deleted.find(params[:id])
  end

  def set_industria
    @industria = Industria.friendly.find(params[:industria_id])
  end

  def produto_params
    params.require(:produto).permit(:foto, :descricao, :preco, :detalhe)
  end

end
