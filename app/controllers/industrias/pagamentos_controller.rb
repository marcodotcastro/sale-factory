class Industrias::PagamentosController < ApplicationController
  before_action :set_industria, only: [:index, :new, :create]
  before_action :set_pagamento, only: [:show]

  def index
    @pagamentos = get_pagamentos.result(distinct: true).page(params[:page_pagamento])
  end

  def show

  end

  def new
    @pagamento = Pagamento.new
  end

  def create
    @pagamento = Pagamento.new(pagamento_params)

    respond_to do |format|
      if @pagamento.save
        format.html {redirect_to industria_pagamentos_path(@industria), flash: {success: 'Produto foi criado com sucesso.'}}
      else
        format.html {render :new}
      end
    end
  end

  private

  def set_pagamento
    @pagamento = Pagamento.find(params[:id])
  end

  def set_industria
    @industria = Industria.friendly.find(params[:industria_id])
  end

  def get_pagamentos
    @q = current_usuario.pagamentos.order(id: :desc).ransack(params[:q])
  end

  def pagamento_params
    params.require(:pagamento).permit(:usuario_id, :plano_id, :periodo)
  end

end
