class LeadsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:more_infos, :create]
  def more_infos
    @lead = Lead.new
    authorize @lead
  end

  def create
    @lead = Lead.new(lead_params)
    authorize @lead
    if @lead.save
      respond_to do |format|
        format.html { redirect_to partners_path, notice: 'Votre inscription est confirmée, à très bientôt !' }
      end
    else
      render :more_infos
    end


  end

  private

  def lead_params
    params.require(:lead).permit(:brand, :email, :phone, :contact_person, :referal)
  end
end
