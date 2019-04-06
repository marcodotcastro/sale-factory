# == Schema Information
#
# Table name: lojistas
#
#  id                         :bigint(8)        not null, primary key
#  cep                        :string
#  descricao                  :string
#  endereco                   :string
#  latitude                   :float
#  longitude                  :float
#  telefone                   :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  cidade_id                  :bigint(8)
#  representante_comercial_id :bigint(8)
#
# Indexes
#
#  index_lojistas_on_cidade_id                   (cidade_id)
#  index_lojistas_on_representante_comercial_id  (representante_comercial_id)
#
# Foreign Keys
#
#  fk_rails_...  (cidade_id => cidades.id)
#  fk_rails_...  (representante_comercial_id => representante_comerciais.id)
#

class LojistasController < ApplicationController
  before_action :set_lojista, only: [:show, :edit, :update, :destroy]

  # GET /lojistas
  # GET /lojistas.json
  def index
    @lojistas = Lojista.all
  end

  # GET /lojistas/1
  # GET /lojistas/1.json
  def show
  end

  # GET /lojistas/new
  def new
    @lojista = Lojista.new
  end

  # GET /lojistas/1/edit
  def edit
  end

  # POST /lojistas
  # POST /lojistas.json
  def create
    @lojista = Lojista.new(lojista_params)

    respond_to do |format|
      if @lojista.save
        format.html { redirect_to @lojista, notice: 'Lojista was successfully created.' }
        format.json { render :show, status: :created, location: @lojista }
      else
        format.html { render :new }
        format.json { render json: @lojista.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lojistas/1
  # PATCH/PUT /lojistas/1.json
  def update
    respond_to do |format|
      if @lojista.update(lojista_params)
        format.html { redirect_to @lojista, notice: 'Lojista was successfully updated.' }
        format.json { render :show, status: :ok, location: @lojista }
      else
        format.html { render :edit }
        format.json { render json: @lojista.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lojistas/1
  # DELETE /lojistas/1.json
  def destroy
    @lojista.destroy
    respond_to do |format|
      format.html { redirect_to lojistas_url, notice: 'Lojista was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lojista
      @lojista = Lojista.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lojista_params
      params.require(:lojista).permit(:nome, :endereco, :telefone, :cep, :latitude, :longitude)
    end
end
