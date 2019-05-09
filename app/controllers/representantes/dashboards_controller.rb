class Representantes::DashboardsController < ApplicationController
  before_action :set_representante, only: [:geral]

  def geral
    @total_vendas = @representante.total_de_vendas
    @total_lojistas = @representante.total_de_lojistas
    @total_cidades = @representante.total_de_cidades
  end

  #FIXME: Remover metodos das actions
  def mapa_lojistas
    listas_consulta

    @lojista_list = current_usuario.representante.lojistas.order(descricao: :asc)

    consultar_cidades

    consultar_lojistas
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
    @lojistas = q_lojistas.result(distinct: true).joins(:representantes).where("lojistas_representantes.representante_id = #{current_usuario.representante.id}")
  end

  def consultar_cidades
    if params[:cidade].present?
      q_cidades = Cidade.ransack(estado_eq: params[:cidade][:estado_eq], descricao_eq: params[:cidade][:descricao_eq], populacao_gteq: params[:cidade][:populacao_gteq])
    else
      q_cidades = Cidade.ransack(estado_eq: current_usuario.representante.cidade.estado)
    end
    @cidades = q_cidades.result(distinct: true)
  end

  #FIXME: Refatorar
  def listas_consulta
    @estado_list = Cidade.select(:estado).distinct.order(estado: :asc)
    @cidade_list = Cidade.select(:descricao).distinct.order(descricao: :asc)
  end

end
