class CampaignsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_pro!
  before_action :set_page_params, only: [:new, :create]


  def new
    @pro = current_pro
    @product = Product.find(params[:product_id])
    @campaign = Campaign.new
    authorize @campaign
  end

  def create
    @pro = current_pro
    @product = Product.find(params[:product_id])
    @campaign = @product.campaigns.build(campaign_params)
    authorize @campaign
    if @campaign.save
      redirect_to products_path
    else
      render :new
    end

  end

  def show

  end

  def promo

  end

  private

  def set_page_params
    @page = params["action"]
  end

  def campaign_params
    params.require(:campaign).permit(:test_type, :price_1, :price_2, :price_3)
  end


end
