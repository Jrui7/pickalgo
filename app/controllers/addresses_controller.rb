class AddressesController < ApplicationController
  before_action :set_resident

  def create
    @address = @resident.addresses.new(address_params)
    if @address.save
      redirect_to [@resident, :edit]
    end
  end

  def update
  end

  private

  def set_resident
    resource, id = request.path.split('/')[1,2]
    @resident = resource.singularize.classify.constantize.find(id)
  end

  def address_params
    params.require(:address).permit(:street, :zip_code, :city)
  end

end
