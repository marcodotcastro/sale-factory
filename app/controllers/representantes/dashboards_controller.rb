class Representantes::DashboardsController < ApplicationController
  before_action :set_representante, only: [:geral]
  before_action :get_estados, only: [:mapa_lojistas]
  before_action :get_cidades, only: [:mapa_lojistas]
  before_action :consultar_cidades, only: [:mapa_lojistas]
  before_action :consultar_lojistas, only: [:mapa_lojistas]

  def geral
    @total_de_vendas = @representante.total_de_vendas
    @total_lojistas = @representante.total_de_lojistas
    @total_cidades = @representante.total_de_cidades

    @total_de_receitas = @representante.total_de_receitas
    @vendas_no_ano = Solicitacao.where(status: "aceito", representante_id: @representante.id).where(venda_data: 6.months.ago..Time.now).joins(pedidos: [:produto]).select("date_trunc('month', venda_data) as mes, SUM(produtos.preco * pedidos.quantidade) as vendas").group("mes")
  end

  def mapa_lojistas
    @select_lojistas = current_usuario.representante.lojistas.order(descricao: :asc)
  end

  private

  def set_representante
    @representante = Representante.friendly.find(params[:representante_id])
  end

  def consultar_lojistas
    if params[:lojista].present?
      q_lojistas = Lojista.ransack(id_eq: params[:lojista][:id_eq])
    else
      q_lojistas = Lojista.ransack(cidade_estado_eq: current_usuario.representante.cidade.estado)
    end
    @lojistas = q_lojistas.result(distinct: true).joins(:representantes).where("lojistas_representantes.representante_id = #{current_usuario.representante.id}").order(descricao: :asc)
  end

  def consultar_cidades
    if params[:cidade].present?
      q_cidades = Cidade.ransack(estado_eq: params[:cidade][:estado_eq], descricao_eq: params[:cidade][:descricao_eq], populacao_gteq: params[:cidade][:populacao_gteq])
    else
      q_cidades = Cidade.ransack(estado_eq: current_usuario.representante.cidade.estado)
    end
    @cidades = q_cidades.result(distinct: true).order(descricao: :asc)
  end

  def get_estados
    @select_estados = Cidade.select(:estado).distinct.order(estado: :asc)
  end

  def get_cidades
    @select_cidades = Cidade.select(:descricao).distinct.order(descricao: :asc)
  end

end
