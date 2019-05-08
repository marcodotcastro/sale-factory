class Clientes::DashboardsController < ApplicationController
  before_action :consultar_lojistas, only: [:mapa_lojistas]
  before_action :consultar_representantes, only: [:mapa_representantes]
  before_action :consultar_cidades, only: [:mapa_representantes, :mapa_lojistas]
  before_action :get_cidades, only: [:mapa_representantes, :mapa_lojistas]
  before_action :get_estados, only: [:mapa_representantes, :mapa_lojistas]

  def ranking
    @representantes_mais_vendas = Representante.joins(:solicitacoes).where("solicitacoes.status = 'aceito'").select("representantes.*", "count(solicitacoes.id) as solicitacoes_por_representante").order(solicitacoes_por_representante: :desc).group(:id).limit(10)
    @lojistas_mais_compras = Lojista.joins(:solicitacoes).where("solicitacoes.status = 'aceito'").select("lojistas.*", "count(solicitacoes.id) as solicitacoes_por_lojista").order(solicitacoes_por_lojista: :desc).group(:id).limit(10)

    @representantes_mais_lojistas = Representante.joins(:lojistas).distinct.select("representantes.*", "count( DISTINCT lojistas.id) as lojistas_por_representante").order(lojistas_por_representante: :desc).group(:id).limit(10)
    @representantes_mais_cidades = Representante.joins(lojistas: [:cidade]).distinct.select("representantes.*", "count( DISTINCT cidades.id) as cidades_por_representantes").order(cidades_por_representantes: :desc).group(:id).limit(10)
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
    @lojista_list = current_usuario.cliente.lojistas.order(descricao: :asc)
  end

  def mapa_representantes
    @representante_list = current_usuario.cliente.representantes.order(descricao: :asc)
  end

  private

  def consultar_lojistas
    if params[:lojista].present?
      q_lojistas = Lojista.ransack(id_eq: params[:lojista][:id_eq])
    else
      q_lojistas = Lojista.ransack(cidade_estado_eq: current_usuario.cliente.cidade.estado)
    end
    @lojistas = q_lojistas.result(distinct: true).joins(:clientes).where("clientes_lojistas.cliente_id = #{current_usuario.cliente.id}")
  end

  def consultar_representantes
    if params[:representante].present?
      q_representantes = Representante.ransack(id_eq: params[:representante][:id_eq], cliente_id: current_usuario.cliente.id)
    else
      q_representantes = Representante.ransack(cidade_estado_eq: current_usuario.cliente.cidade.estado, cliente_id: current_usuario.cliente.id)
    end
    @representantes = q_representantes.result(distinct: true).joins(:clientes).where("clientes_representantes.cliente_id = #{current_usuario.cliente.id}")
  end

  def consultar_cidades
    if params[:cidade].present?
      q_cidades = Cidade.ransack(estado_eq: params[:cidade][:estado_eq], descricao_eq: params[:cidade][:descricao_eq], populacao_gteq: params[:cidade][:populacao_gteq])
    else
      q_cidades = Cidade.ransack(estado_eq: current_usuario.cliente.cidade.estado)
    end
    @cidades = q_cidades.result(distinct: true)
  end

  def get_estados
    @estado_list = Cidade.select(:estado).distinct.order(estado: :asc)
  end

  def get_cidades
    @cidade_list = Cidade.select(:descricao).distinct.order(descricao: :asc)
  end

end
