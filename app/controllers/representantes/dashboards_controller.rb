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

  def performance_lojista
    @lojistas_mais_compras = Lojista.joins(solicitacoes: [:pedidos], representantes: [:industrias]).where("solicitacoes.status = 'aceito' and representantes.id = #{current_usuario.representante.id}").select("lojistas.*", "count(solicitacoes.id) as solicitacoes_por_lojista").order(solicitacoes_por_lojista: :desc).group(:id).limit(10)
    @lojistas_mais_pedidos = Lojista.joins(solicitacoes: [:pedidos], representantes: [:industrias]).where("solicitacoes.status = 'aceito' and representantes.id = #{current_usuario.representante.id}").select("lojistas.*", "sum(pedidos.quantidade) as pedidos_por_produto").order(pedidos_por_produto: :desc).group(:id).limit(10)
  end

  def performance_produto
    @produtos_mais_compras = Produto.joins(pedidos: [:solicitacao]).where("solicitacoes.status = 'aceito' and solicitacoes.representante_id = #{current_usuario.representante.id}").select("produtos.*", "count(solicitacoes.id) as solicitacoes_por_produto").order(solicitacoes_por_produto: :desc).group(:id).limit(10)
    @produtos_mais_pedidos = Produto.joins(pedidos: [:solicitacao]).where("solicitacoes.status = 'aceito' and solicitacoes.representante_id = #{current_usuario.representante.id}").select("produtos.*", "sum(pedidos.quantidade) as pedidos_por_produto").order(pedidos_por_produto: :desc).group(:id).limit(10)
  end

  def mapa_lojistas
    @select_lojistas = current_usuario.representante.lojistas.order(descricao: :asc)
  end

  def mapa_solicitacoes
    @solicitacoes = current_usuario.representante.solicitacoes.where(status: "aceito")
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
