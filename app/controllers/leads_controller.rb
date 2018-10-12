class LeadsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:inscription_pro, :create]
  def inscription_pro
    @lead = Lead.new
    authorize @lead
  end

  def create
    @lead = Lead.new(lead_params)
    authorize @lead
    respond_to do |format|
      format.html { redirect_to partner_path }
      # format.js
    end

  end

  private

  def lead_params
    params.require(:lead).permit(:brand, :email, :phone, :contact_person, :referal)
  end
end
