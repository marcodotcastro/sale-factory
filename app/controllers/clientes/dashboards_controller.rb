class Clientes::DashboardsController < ApplicationController

  def ranking
    @representantes_mais_vendas = Representante.order(id: :desc).last(10)
    @lojistas_mais_compras = Lojista.order(id: :desc).last(10)
  end

  def geral
    @representantes_mais_vendas = Representante.order(id: :desc).last(10)
  end

  def representante
    @representante = Representante.find(params[:id])
  end

end
