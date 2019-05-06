class Clientes::DashboardsController < ApplicationController

  def ranking
    @representantes_mais_vendas = Representante.order(id: :desc).last(10)
    @lojistas_mais_compras = Lojista.order(id: :desc).last(10)
  end

  def geral
    cliente = current_usuario.cliente

    @total_representantes = cliente.total_de_representantes

    @total_vendas = cliente.total_de_vendas

    @total_lojistas = cliente.total_de_lojistas

    @total_cidades = cliente.total_de_cidades
  end

  def representante
    @representante = Representante.friendly.find(params[:id])
    cliente = current_usuario.cliente


    @total_vendas = @representante.total_de_vendas(cliente)

    @total_lojistas = @representante.total_de_lojistas(cliente)

    @total_cidades = @representante.total_de_cidades(cliente)
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
