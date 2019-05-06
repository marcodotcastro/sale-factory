class Representantes::DashboardsController < ApplicationController
  before_action :set_representante, only: [:geral]

  def geral
    @total_vendas = @representante.total_de_vendas
    @total_lojistas = @representante.total_de_lojistas
    @total_cidades = @representante.total_de_cidades
  end

  def mapa_lojistas
    @cidades = Cidade.all
    @lojistas = Lojista.all
  end

  def mapa_representantes
    @cidades = Cidade.all
    @representantes = Representante.all
  end

  private

  def set_representante
    @representante = Representante.friendly.find(params[:representante_id])
  end

end
