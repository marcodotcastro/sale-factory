class Industrias::PagamentosController < ApplicationController
  before_action :set_industria, only: [:index]

  def index
    @pagamentos = get_pagamentos.result(distinct: true).page(params[:page_pagamento])
  end


  private

  def set_industria
    @industria = Industria.friendly.find(params[:industria_id])
  end

  def get_pagamentos
    @q = current_usuario.pagamentos.order(validade: :asc).ransack(params[:q])
  end

end
