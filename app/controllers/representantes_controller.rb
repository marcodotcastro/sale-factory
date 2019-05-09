# == Schema Information
#
# Table name: representantes
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
#  slug              :string
#  telefone          :string
#  telefone_whatsapp :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  cidade_id         :bigint(8)
#  usuario_id        :bigint(8)
#
# Indexes
#
#  index_representantes_on_cidade_id   (cidade_id)
#  index_representantes_on_deleted_at  (deleted_at)
#  index_representantes_on_slug        (slug) UNIQUE
#  index_representantes_on_usuario_id  (usuario_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#

class RepresentantesController < ApplicationController
  before_action :set_representante, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @representante = Representante.new
  end

  def edit
  end

  def create
    @representante = Representante.new(representante_params)

    respond_to do |format|
      if @representante.save!
        format.html {redirect_to representante_path(@representante), flash: {success: 'representante foi criado com sucesso.'}}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @representante.update(representante_params)
        format.html {redirect_to representante_path(@representante), flash: {success: 'representante foi alterado com sucesso.'}}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @representante.destroy
    respond_to do |format|
      format.html {redirect_to representantes_path, flash: {success: 'representante foi excluido com sucesso.'}}
    end
  end

  private

  def get_lojistas
    @representante.lojistas
  end

  def set_representante
    @representante = Representante.friendly.find(params[:id])
  end

  def representante_params
    params.require(:representante).permit(:logo, :descricao, :contato, :endereco, :cep, :telefone, :telefone_whatsapp, :email, :latitude, :longitude, :cidade_id, :usuario_id, industrias: [:industria_id])
  end
end
