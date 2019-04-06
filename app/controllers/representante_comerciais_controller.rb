class RepresentanteComerciaisController < ApplicationController
  before_action :set_representante_comercial, only: [:show, :edit, :update, :destroy]

  # GET /representante_comerciais
  # GET /representante_comerciais.json
  def index
    @representante_comerciais = RepresentanteComercial.all
  end

  # GET /representante_comerciais/1
  # GET /representante_comerciais/1.json
  def show
  end

  # GET /representante_comerciais/new
  def new
    @representante_comercial = RepresentanteComercial.new
  end

  # GET /representante_comerciais/1/edit
  def edit
  end

  # POST /representante_comerciais
  # POST /representante_comerciais.json
  def create
    @representante_comercial = RepresentanteComercial.new(representante_comercial_params)

    respond_to do |format|
      if @representante_comercial.save
        format.html { redirect_to @representante_comercial, notice: 'Representante comercial was successfully created.' }
        format.json { render :show, status: :created, location: @representante_comercial }
      else
        format.html { render :new }
        format.json { render json: @representante_comercial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /representante_comerciais/1
  # PATCH/PUT /representante_comerciais/1.json
  def update
    respond_to do |format|
      if @representante_comercial.update(representante_comercial_params)
        format.html { redirect_to @representante_comercial, notice: 'Representante comercial was successfully updated.' }
        format.json { render :show, status: :ok, location: @representante_comercial }
      else
        format.html { render :edit }
        format.json { render json: @representante_comercial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /representante_comerciais/1
  # DELETE /representante_comerciais/1.json
  def destroy
    @representante_comercial.destroy
    respond_to do |format|
      format.html { redirect_to representante_comerciais_url, notice: 'Representante comercial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_representante_comercial
      @representante_comercial = RepresentanteComercial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def representante_comercial_params
      params.require(:representante_comercial).permit(:descricao, :contato, :endereco, :cep, :telefone, :email, :latitude, :longitude)
    end
end
