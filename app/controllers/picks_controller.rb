class PicksController < ApplicationController
  before_action :set_pick, only: [:show, :update, :edit, :remove_participation]

  def show
    authorize @pick
    @user = @pick.user
    @product = @pick.campaign.product
  end

  def update
    authorize @pick
    if @pick.campaign.open_type?
      if @pick.update(pick_params_open)
        redirect_to new_pick_reservation_path(@pick.id)
      end
    else
      if @pick.update(pick_params_ab)
        if @pick.answer == "Yes"
          @pick.update(state: "pending")
          redirect_to new_pick_reservation_path(@pick.id)
        else
          @pick.update(state: nil)
          redirect_to campaigns_path
        end
      end
    end
  end

  def edit
    authorize @pick
    @user = @pick.user
    @user.address.present? ? @address = @user.address : @address = Address.new
    @product = @pick.campaign.product
    unless @user.customer_id.blank?
      @customer_infos = Stripe::Customer.retrieve(@user.customer_id).sources.data[0]
    end
  end

  def remove_participation
    authorize @pick
    @user = @pick.user
    if @pick.campaign.ab_campaign?
      @pick.update(state: "removed", size: nil, delivery_infos: {},  answer: nil)
    else
      @pick.update(state: "removed", size: nil, delivery_infos: {}, price: nil)
    end

    respond_to do |format|
      format.html {redirect_to my_campaigns_path}
      format.js
    end
  end

  private

  def set_pick
    @pick = Pick.find(params[:id])
  end

  def pick_params_ab
    params.require(:pick).permit(:answer, :size)
  end

  def pick_params_open
    params.require(:pick).permit(:price, :size).merge(state: "pending")
  end

end
