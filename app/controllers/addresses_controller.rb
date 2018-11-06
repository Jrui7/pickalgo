class AddressesController < ApplicationController
  def create
    url = Rails.application.routes.recognize_path(request.referrer)
    pick = Pick.find(url[:pick_id])
    @address = Address.new(address_params_form_payment)
    @address.user_id = current_user.id
    authorize @address
    if @address.save
      flash[:notice] = "Adresse enregistrée"
      respond_to do |format|
        format.html { redirect_to new_pick_participation_path(pick)}
      end
    else
      flash[:notice] = "Erreur: adresse non enregistrée"
      redirect_to new_pick_participation_path(pick)
    end

  end


  def update
    url = Rails.application.routes.recognize_path(request.referrer)
    pick = Pick.find(url[:pick_id])
    @address = current_user.address
    authorize @address

    if @address.update(address_params_form_payment)
      flash[:notice] = "Adresse modifiée avec succès"
      respond_to do |format|
        format.html { redirect_to new_pick_participation_path(pick)}
      end
    end
  end


  private

  def address_params_form_payment
    params.require(:address).permit(:first_name, :last_name, :street, :address_complement, :zip_code, :city, :phone_number)
  end
end
