class Representantes::DashboardsController < ApplicationController

  def ranking
    @representantes_mais_vendas = Representante.order(id: :desc).last(10)
    @lojistas_mais_compras = Lojista.order(id: :desc).last(10)
  end

  def geral
    @representantes_mais_vendas = Representante.order(id: :desc).last(10)
  end

  def membro
    @representantes_mais_vendas = Representante.order(id: :desc).last(10)
  end

end
