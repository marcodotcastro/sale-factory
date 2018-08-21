class ShopkeepersController < ApplicationController
  before_action :set_shopkeeper, only: [:show, :edit, :update, :destroy]

  # GET /shopkeepers
  # GET /shopkeepers.json
  def index
    @shopkeepers = Shopkeeper.all
  end

  # GET /shopkeepers/1
  # GET /shopkeepers/1.json
  def show
  end

  # GET /shopkeepers/new
  def new
    @shopkeeper = Shopkeeper.new
  end

  # GET /shopkeepers/1/edit
  def edit
  end

  # POST /shopkeepers
  # POST /shopkeepers.json
  def create
    @shopkeeper = Shopkeeper.new(shopkeeper_params)

    respond_to do |format|
      if @shopkeeper.save
        format.html {redirect_to @shopkeeper, notice: 'Shopkeeper was successfully created.'}
        format.json {render :show, status: :created, location: @shopkeeper}
      else
        format.html {render :new}
        format.json {render json: @shopkeeper.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /shopkeepers/1
  # PATCH/PUT /shopkeepers/1.json
  def update
    respond_to do |format|
      if @shopkeeper.update(shopkeeper_params)
        format.html {redirect_to @shopkeeper, notice: 'Shopkeeper was successfully updated.'}
        format.json {render :show, status: :ok, location: @shopkeeper}
      else
        format.html {render :edit}
        format.json {render json: @shopkeeper.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /shopkeepers/1
  # DELETE /shopkeepers/1.json
  def destroy
    @shopkeeper.destroy
    respond_to do |format|
      format.html {redirect_to shopkeepers_url, notice: 'Shopkeeper was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  def service_area
    @shopkeepers = Shopkeeper.all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shopkeeper
    @shopkeeper = Shopkeeper.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def shopkeeper_params
    params.require(:shopkeeper).permit(:name, :address, :state, :city, :phone, :cep, :latitude, :longitude)
  end
end
