class RepresentativesController < ApplicationController
  before_action :set_representative, only: [:show, :edit, :update, :destroy]

  # GET /representatives
  # GET /representatives.json
  def index
    @representatives = Representative.all
  end

  # GET /representatives/1
  # GET /representatives/1.json
  def show;
  end

  # GET /representatives/new
  def new
    @representative = Representative.new
  end

  # GET /representatives/1/edit
  def edit;
  end

  # POST /representatives
  # POST /representatives.json
  def create
    @representative = Representative.new(representative_params)

    respond_to do |format|
      if @representative.save
        format.html {redirect_to @representative, notice: 'Representative was successfully created.'}
        format.json {render :show, status: :created, location: @representative}
      else
        format.html {render :new}
        format.json {render json: @representative.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /representatives/1
  # PATCH/PUT /representatives/1.json
  def update
    respond_to do |format|
      if @representative.update(representative_params)
        format.html {redirect_to @representative, notice: 'Representative was successfully updated.'}
        format.json {render :show, status: :ok, location: @representative}
      else
        format.html {render :edit}
        format.json {render json: @representative.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /representatives/1
  # DELETE /representatives/1.json
  def destroy
    @representative.destroy
    respond_to do |format|
      format.html {redirect_to representatives_url, notice: 'Representative was successfully destroyed.'}
      format.json {head :no_content}
    end
  end


  def service_area
    @representatives = Representative.all
    @shopkeepers = Shopkeeper.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_representative
    @representative = Representative.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def representative_params
    params.require(:representative).permit(:description, :contact, :address, :cep, :phone, :email, :latitude, :longitude)
  end
end
