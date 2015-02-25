class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy, :delivery]

  # GET /inventories
  # GET /inventories.json
  def index
    @inventories = Inventory.all
    respond_to do |format|
      format.html
      format.csv { send_data @inventories.to_csv }
      format.xls # { send_data @products.to_csv(col_sep: "\t") }
    end
  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  # GET /inventories/1/delivery
  def delivery
    @device = Device.new
    @device.type_id = @inventory.type_id
    @device.brand_id = @inventory.brand_id
    @device.model = @inventory.model
    @device.asset_number = @inventory.asset_number
    @device.value = @inventory.value
    @device.fund_source = @inventory.fund_source
    @device.factory_number = @inventory.factory_number
    @device.production_date = @inventory.production_date
    @device.note = @inventory.note
    @inventory_id = @inventory.id
  end

  # GET /inventories/1/edit
  def edit
  end

  # POST /inventories
  # POST /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to @inventory, notice: 'Inventory was successfully created.' }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1
  # PATCH/PUT /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to @inventory, notice: 'Inventory was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1
  # DELETE /inventories/1.json
  def destroy
    @inventory.destroy
    respond_to do |format|
      format.html { redirect_to inventories_url, notice: 'Inventory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_params
      params.require(:inventory).permit(:type_id, :brand_id, :model, :asset_number, :value, :fund_source, :factory_number, :production_date, :note)
    end
end
