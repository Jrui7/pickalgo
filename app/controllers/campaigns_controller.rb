class CampaignsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_pro!
  before_action :set_page_params, only: [:new, :create]

  def new
    @product = Product.find(params[:product_id])
    @campaign = Campaign.new
    authorize @campaign
  end

  def create

  end

  private

  def set_page_params
    @page = params["action"]
  end


end
