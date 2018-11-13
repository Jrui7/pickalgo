class CampaignsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :edit, :create, :promo, :update]
  before_action :authenticate_pro!, only: [:new, :edit, :create, :promo, :update]
  before_action :set_page_params, only: [:new, :edit, :create, :promo]


  def index
    @user = current_user
    @categories = Category.all
    if params[:category].present?
      @filter = Category.friendly.find(params[:category])
      @campaigns = policy_scope(Campaign).includes(:product, :category).where(category: @filter).paginate(page: params[:page])
    else
      @campaigns = policy_scope(Campaign).includes(:product, :category).paginate(page: params[:page])
    end
    respond_to do |format|
      format.html
      format.js
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
      flash[:notice] = "Campagne lancée avec succès"
      redirect_to products_path
    else
      flash[:alert] = "Erreur, informations incomplètes"
      render :new
    end
  end

  # Pour les testeurs
  def show
    @campaign = Campaign.friendly.find(params[:id])
    authorize @campaign
    @campaign.increment_views
    @product = @campaign.product
    @user = current_user
    @pick = Pick.where(campaign: @campaign, user: @user).first
    if @pick.blank?
      if @campaign.ab_campaign?
        nb_1 = @campaign.picks.where(price: @campaign.price_1).count
        nb_2 = @campaign.picks.where(price: @campaign.price_2).count
        nb_1 <= nb_2 ? @price = @campaign.price_1 : @price = @campaign.price_2
        if @campaign.price_3?
          nb_3 = @campaign.picks.where(price: @campaign.price_3).count
          @price = @campaign.price_3 if nb_3 <= nb_1 && nb_3 <= nb_2
        end
        @pick = Pick.create(campaign: @campaign, user: @user, price: @price)
      else
        @pick = Pick.create(campaign: @campaign, user: @user)
      end
    end


  end

  def edit
    @campaign = Campaign.friendly.find(params[:id])
    authorize @campaign
    @pro = @campaign.product.pro
  end

  # Pour le pro
  def promo
    @campaign = Campaign.friendly.find(params[:id])
    @pro = current_pro
    authorize @campaign
    @uniq_views = @campaign.uniq_views
    @added_to_cart = @campaign.all_cart_additions
    @validated_picks = @campaign.validated_picks
  end

  def update
    @campaign = Campaign.friendly.find(params[:id])
    authorize @campaign
    binding.pry
  end

  private

  def set_page_params
    @page = params["controller"]
  end

  def campaign_params
    params.require(:campaign).permit(:test_type, :price_1, :price_2, :price_3)
  end




end
