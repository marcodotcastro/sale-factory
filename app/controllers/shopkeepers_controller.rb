class ShopkeepersController < ApplicationController
  before_action :set_shopkeeper, only: [:show, :edit, :update, :destroy]

  # GET /shopkeepers
  # GET /shopkeepers.json
  def index
    @shopkeepers = Shopkeeper.all.page(params[:page])
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
        format.html {redirect_to shopkeepers_url, notice: 'Shopkeeper was successfully created.'}
      else
        format.html {render :new}
      end
    end
  end

  # PATCH/PUT /shopkeepers/1
  # PATCH/PUT /shopkeepers/1.json
  def update
    respond_to do |format|
      if @shopkeeper.update(shopkeeper_params)
        format.html {redirect_to shopkeepers_url, notice: 'Shopkeeper was successfully updated.'}
      else
        format.html {render :edit}
      end
    end
  end

  # DELETE /shopkeepers/1
  # DELETE /shopkeepers/1.json
  def destroy
    @shopkeeper.destroy
    respond_to do |format|
      format.html {redirect_to shopkeepers_url, notice: 'Shopkeeper was successfully destroyed.'}
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
