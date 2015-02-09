class MaintenancersController < ApplicationController
  before_action :set_maintenancer, only: [:show, :edit, :update, :destroy]

  # GET /maintenancers
  # GET /maintenancers.json
  def index
    @maintenancers = Maintenancer.all
  end

  # GET /maintenancers/1
  # GET /maintenancers/1.json
  def show
  end

  # GET /maintenancers/new
  def new
    @maintenancer = Maintenancer.new
  end

  # GET /maintenancers/1/edit
  def edit
  end

  # POST /maintenancers
  # POST /maintenancers.json
  def create
    @maintenancer = Maintenancer.new(maintenancer_params)

    respond_to do |format|
      if @maintenancer.save
        format.html { redirect_to @maintenancer, notice: 'Maintenancer was successfully created.' }
        format.json { render :show, status: :created, location: @maintenancer }
      else
        format.html { render :new }
        format.json { render json: @maintenancer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenancers/1
  # PATCH/PUT /maintenancers/1.json
  def update
    respond_to do |format|
      if @maintenancer.update(maintenancer_params)
        format.html { redirect_to @maintenancer, notice: 'Maintenancer was successfully updated.' }
        format.json { render :show, status: :ok, location: @maintenancer }
      else
        format.html { render :edit }
        format.json { render json: @maintenancer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenancers/1
  # DELETE /maintenancers/1.json
  def destroy
    @maintenancer.destroy
    respond_to do |format|
      format.html { redirect_to maintenancers_url, notice: 'Maintenancer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenancer
      @maintenancer = Maintenancer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maintenancer_params
      params.require(:maintenancer).permit(:name)
    end
end
