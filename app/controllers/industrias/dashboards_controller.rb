class Industrias::DashboardsController < ApplicationController
  before_action :set_industria, only: [:mapa_representantes, :mapa_lojistas]
  before_action :consultar_lojistas, only: [:mapa_lojistas]
  before_action :consultar_representantes, only: [:mapa_representantes]
  before_action :consultar_cidades, only: [:mapa_representantes, :mapa_lojistas]
  before_action :get_cidades, only: [:mapa_representantes, :mapa_lojistas]
  before_action :get_estados, only: [:mapa_representantes, :mapa_lojistas]

  def ranking
    @representantes_mais_vendas = Representante.joins(:solicitacoes, :industrias).where("solicitacoes.status = 'aceito' and industrias.id = #{current_usuario.industria.id}").select("representantes.*", "count(solicitacoes.id) as vendas_por_representante").order(vendas_por_representante: :desc).group(:id).limit(10)
    @representantes_mais_receitas = Representante.joins(:industrias, solicitacoes: [:produtos]).where("solicitacoes.status = 'aceito' and industrias.id = #{current_usuario.industria.id}").select("representantes.*", "sum(produtos.preco * pedidos.quantidade) as receitas_por_representante").order(receitas_por_representante: :desc).group(:id).limit(10)
    @lojistas_mais_compras = Lojista.joins(:solicitacoes, representantes: [:industrias]).where("solicitacoes.status = 'aceito' and industrias.id = #{current_usuario.industria.id}").select("lojistas.*", "count(solicitacoes.id) as solicitacoes_por_lojista").order(solicitacoes_por_lojista: :desc).group(:id).limit(10)

    @representantes_mais_lojistas = Representante.joins(:lojistas, :industrias, :solicitacoes).where("solicitacoes.status = 'aceito' and industrias.id = #{current_usuario.industria.id}").distinct.select("representantes.*", "count( DISTINCT lojistas.id) as lojistas_por_representante").order(lojistas_por_representante: :desc).group(:id).limit(10)
    @representantes_mais_cidades = Representante.joins(:industrias, :solicitacoes, lojistas: [:cidade]).where("solicitacoes.status = 'aceito' and industrias.id = #{current_usuario.industria.id}").distinct.select("representantes.*", "count( DISTINCT cidades.id) as cidades_por_representantes").order(cidades_por_representantes: :desc).group(:id).limit(10)
  end

  def geral
    industria = current_usuario.industria

    @total_representantes = industria.total_de_representantes
    @total_de_vendas = industria.total_de_vendas
    @total_lojistas = industria.total_de_lojistas
    @total_cidades = industria.total_de_cidades

    @total_de_receitas = industria.total_de_receitas
    @vendas_6_meses = Solicitacao.where(status: "aceito", industria_id: current_usuario.industria.id).where(venda_data: 6.months.ago..Time.now).joins(pedidos: [:produto]).select("date_trunc('month', venda_data) as mes, SUM(produtos.preco * pedidos.quantidade) as vendas").group("mes")
  end

  def representante
    @representante = Representante.friendly.find(params[:id])
    industria = current_usuario.industria

    @total_de_vendas = @representante.total_de_vendas(industria)
    @total_lojistas = @representante.total_de_lojistas(industria)
    @total_cidades = @representante.total_de_cidades(industria)

    @vendas_6_meses = Solicitacao.where(status: "aceito", industria_id: current_usuario.industria.id, representante_id: @representante.id).where(venda_data: 6.months.ago..Time.now).joins(pedidos: [:produto]).select("date_trunc('month', venda_data) as mes, SUM(produtos.preco * pedidos.quantidade) as vendas").group("mes")
    @total_de_receitas = @representante.total_de_receitas(industria)
  end

  def mapa_lojistas
    @select_lojistas = current_usuario.industria.lojistas.order(descricao: :asc)
  end

  def mapa_representantes
    @select_representantes = current_usuario.industria.representantes.order(descricao: :asc)
  end

  private

  def consultar_lojistas
    if params[:lojista].present?
      q_lojistas = Lojista.ransack(id_eq: params[:lojista][:id_eq])
    else
      q_lojistas = Lojista.ransack(cidade_estado_eq: current_usuario.industria.cidade.estado)
    end
    @lojistas = q_lojistas.result(distinct: true).joins(:industrias).where("industrias_lojistas.industria_id = #{current_usuario.industria.id}").order(descricao: :asc)
  end

  def consultar_representantes
    if params[:representante].present?
      q_representantes = Representante.ransack(id_eq: params[:representante][:id_eq], industria_id: current_usuario.industria.id)
    else
      q_representantes = Representante.ransack(cidade_estado_eq: current_usuario.industria.cidade.estado, industria_id: current_usuario.industria.id)
    end
    @representantes = q_representantes.result(distinct: true).joins(:industrias).where("industrias_representantes.industria_id = #{current_usuario.industria.id}").order(descricao: :asc)
  end

  def consultar_cidades
    if params[:cidade].present?
      q_cidades = Cidade.ransack(estado_eq: params[:cidade][:estado_eq], descricao_eq: params[:cidade][:descricao_eq], populacao_gteq: params[:cidade][:populacao_gteq])
    else
      q_cidades = Cidade.ransack(estado_eq: current_usuario.industria.cidade.estado)
    end
    @cidades = q_cidades.result(distinct: true).order(descricao: :asc)
  end

  def get_estados
    @select_estados = Cidade.select(:estado).distinct.order(estado: :asc)
  end

  def get_cidades
    @select_cidades = Cidade.select(:descricao).distinct.order(descricao: :asc)
  end

  def set_industria
    @industria = Industria.friendly.find(params[:industria_id])
  end

end
