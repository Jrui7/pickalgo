class LeadsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:inscription_pro, :create]
  def inscription_pro
    @lead = Lead.new
    authorize @lead
  end

  def create
    @lead = Lead.new(lead_params)
    authorize @lead
    if @lead.save
      respond_to do |format|
        format.html { redirect_to partners_path, notice: 'Inscription confirmée !' }
      end
    else
      render :inscription_pro
    end


  end

  private

  def lead_params
    params.require(:lead).permit(:brand, :email, :phone, :contact_person, :referal)
  end
end
