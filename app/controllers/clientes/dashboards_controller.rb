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

    @q_cidades = Cidade.ransack(params[:q_cidades])
    @cidades = @q_cidades.result(distinct: true)

    @q_lojistas = Lojista.ransack(params[:q_lojistas])
    @lojista = @q_lojistas.result(distinct: true)

  end

  def mapa_representantes

    listas_representantes

    consultar_cidades

    consultar_representantes

  end

  private

  def consultar_representantes
    if params[:representante].present?
      q_representantes = Representante.ransack(id_eq: params[:representante][:descricao_eq])
    else
      q_representantes = Representante.ransack(cidade_estado_eq: current_usuario.cliente.cidade.estado)
    end
    @representantes = q_representantes.result(distinct: true)
  end

  def consultar_cidades
    if params[:cidade].present?
      q_cidades = Cidade.ransack(estado_eq: params[:cidade][:estado_eq], descricao_eq: params[:cidade][:descricao_eq], populacao_gteq: params[:cidade][:populacao_gteq])
    else
      q_cidades = Cidade.ransack(estado_eq: current_usuario.cliente.cidade.estado)
    end
    @cidades = q_cidades.result(distinct: true)
  end

  def listas_representantes
    @representante_list = current_usuario.cliente.representantes.order(descricao: :asc)
    @estado_list = Cidade.select(:estado).distinct.order(estado: :asc)
    @cidade_list = Cidade.select(:descricao).distinct.order(descricao: :asc)
  end

end
