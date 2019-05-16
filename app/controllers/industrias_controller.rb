# == Schema Information
#
# Table name: industrias
#
#  id                :bigint(8)        not null, primary key
#  cep               :string
#  cnpj              :string
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
#  setor_id          :bigint(8)
#  usuario_id        :bigint(8)
#
# Indexes
#
#  index_industrias_on_cidade_id   (cidade_id)
#  index_industrias_on_deleted_at  (deleted_at)
#  index_industrias_on_setor_id    (setor_id)
#  index_industrias_on_slug        (slug) UNIQUE
#  index_industrias_on_usuario_id  (usuario_id)
#

class IndustriasController < ApplicationController
  before_action :set_industria, only: [:show, :edit, :update, :destroy]

  def show
    @representantes = @industria.representantes.order(descricao: :asc)
  end

  def new
    @industria = Industria.new
  end

  def edit
  end

  def create
    @industria = Industria.new(industria_params)

    respond_to do |format|
      if @industria.save
        format.html {redirect_to @industria, flash: {success: 'Industria foi criado com sucesso.'}}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @industria.update(industria_params)
        format.html {redirect_to @industria, flash: {success: 'Industria foi alterado com sucesso.'}}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @industria.destroy
    respond_to do |format|
      format.html {redirect_to root_path, flash: {success: 'Industria foi excluido com sucesso.'}}
    end
  end

  private

  def set_industria
    @industria = Industria.friendly.find(params[:id])
  end

  def industria_params
    params.require(:industria).permit(:descricao, :contato, :endereco, :cep, :telefone, :setor_id, :telefone_whatsapp, :email, :latitude, :longitude, :cidade_id, :usuario_id, :logo)
  end
end
