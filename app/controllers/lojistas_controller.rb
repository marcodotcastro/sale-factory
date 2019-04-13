# == Schema Information
#
# Table name: lojistas
#
#  id                :bigint(8)        not null, primary key
#  cep               :string
#  contato           :string
#  deleted_at        :datetime
#  descricao         :string
#  email             :string
#  endereco          :string
#  latitude          :float
#  longitude         :float
#  telefone          :string
#  telefone_whatsapp :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  cidade_id         :bigint(8)
#
# Indexes
#
#  index_lojistas_on_cidade_id   (cidade_id)
#  index_lojistas_on_deleted_at  (deleted_at)
#

class LojistasController < ApplicationController
  before_action :set_lojista, only: [:show, :edit, :update, :destroy]

  def index
    @lojistas = Lojista.all
  end

  def show
  end

  def new
    @lojista = Lojista.new
  end

  def edit
  end

  def create
    @lojista = Lojista.new(lojista_params)

    respond_to do |format|
      if @lojista.save
        format.html {redirect_to representante_lojista_path(@representante, @lojista), flash: {success: 'Lojista was successfully created.'}}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @lojista.update(lojista_params)
        format.html {redirect_to representante_lojista_path(@representante, @lojista), flash: {success: 'Lojista was successfully updated.'}}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @lojista.destroy
    respond_to do |format|
      format.html {redirect_to representante_lojistas_path(@representante), flash: {success: 'Lojista was successfully destroyed.'}}
    end
  end

  private

  def set_lojista
    @lojista = Lojista.find(params[:id])
  end

  def lojista_params
    params.require(:lojista).permit(:nome, :endereco, :telefone, :cep, :latitude, :longitude, :cliente_id, :representante_id, :cidade_id)
  end
end
