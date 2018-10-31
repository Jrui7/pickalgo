class CampaignsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :promo]
  before_action :authenticate_pro!, only: [:new, :create, :promo]
  before_action :set_page_params, only: [:new, :create]


  def index
    @categories = Category.all
    if params[:category].present?
      @filter = Category.friendly.find(params[:category])
      @campaigns = policy_scope(Campaign).where(category: @filter)
    else
      @campaigns = policy_scope(Campaign)
    end
  end

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
    @campaign.category = @product.category
    @campaign.title = @product.title
    if @campaign.save
      redirect_to products_path
    else
      render :new
    end
  end

  def show
    @campaign = Campaign.friendly.find(params[:id])
    authorize @campaign
    @campaign.increment_views
    @product = @campaign.product
    @user = current_user
    @pick = Pick.where(campaign: @campaign, user: @user).first
    if @pick.blank?
      Pick.create(campaign: @campaign, user: @user)
      @pick = Pick.where(campaign: @campaign, user: @user).first
    end
  end


  def promo
    @campaign = Campaign.friendly.find(params[:id])
    authorize @campaign
  end

  private

  def set_page_params
    @page = params["action"]
  end

  def campaign_params
    params.require(:campaign).permit(:test_type, :price_1, :price_2, :price_3)
  end

  def pick_params
    params.require(:pick).permit(:user, :campaign)
  end



end
