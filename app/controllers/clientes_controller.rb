# == Schema Information
#
# Table name: clientes
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
#  setor_id          :bigint(8)
#  usuario_id        :bigint(8)
#
# Indexes
#
#  index_clientes_on_cidade_id   (cidade_id)
#  index_clientes_on_deleted_at  (deleted_at)
#  index_clientes_on_setor_id    (setor_id)
#  index_clientes_on_slug        (slug) UNIQUE
#  index_clientes_on_usuario_id  (usuario_id)
#

class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]

  def show
    @representantes = @cliente.representantes
  end

  def new
    @cliente = Cliente.new
  end

  def edit
  end

  def create
    @cliente = Cliente.new(cliente_params)

    respond_to do |format|
      if @cliente.save
        format.html {redirect_to @cliente, flash: {success: 'Cliente foi criado com sucesso.'}}
      else
        format.html {render :new}
      end
    end
  end

  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html {redirect_to @cliente, flash: {success: 'Cliente foi alterado com sucesso.'}}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @cliente.destroy
    respond_to do |format|
      format.html {redirect_to root_path, flash: {success: 'Cliente foi excluido com sucesso.'}}
    end
  end

  private

  def set_cliente
    @cliente = Cliente.friendly.find(params[:id])
  end

  def cliente_params
    params.require(:cliente).permit(:descricao, :contato, :endereco, :cep, :telefone, :setor_id, :telefone_whatsapp, :email, :latitude, :longitude, :cidade_id, :usuario_id, :logo)
  end
end
