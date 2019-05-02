class Representantes::JogosController < ApplicationController
  before_action :set_representante, only: [:index]

  def index

  end

  private

  def set_representante
    @representante = current_usuario.representante
  end

end
