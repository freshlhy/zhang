class DeviceImportsController < ApplicationController
  def new
    @device_import = DeviceImport.new
  end

  def create
    @device_import = DeviceImport.new(params[:device_import])
    if @device_import.save
      redirect_to devices_path, notice: "Imported devices successfully."
    else
      render :new
    end
  end

  private

    def device_import_params
      params.require(:device_import).permit(:file)
    end

end
