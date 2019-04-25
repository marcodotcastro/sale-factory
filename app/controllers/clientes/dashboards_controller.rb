class Clientes::DashboardsController < ApplicationController

  def ranking
    @representantes_mais_vendas = Representante.order(id: :desc).last(10)
    @lojistas_mais_compras = Lojista.order(id: :desc).last(10)
  end

  def geral
    @representantes_mais_vendas = Representante.order(id: :desc).last(10)
  end

  def representante
    @representante = Representante.friendly.find(params[:id])
  end

  def mapa_lojistas
    @cidades = Cidade.all

    @lojistas = Lojista.all
  end

  def mapa_representantes
    @cidades = Cidade.all

    @representantes = Representante.all
  end

end
