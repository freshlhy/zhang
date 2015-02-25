class InventoryImportsController < ApplicationController
  def new
    @inventory_import = InventoryImport.new
  end

  def create
    @inventory_import = InventoryImport.new(params[:inventory_import])
    if @inventory_import.save
      redirect_to inventories_path, notice: "Imported inventories successfully."
    else
      render :new
    end
  end

  private

    def inventory_import_params
      params.require(:inventory_import).permit(:file)
    end

end
