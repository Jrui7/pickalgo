class PicksController < ApplicationController
  before_action :set_pick, only: [:show, :update, :edit]

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
        redirect_to campaigns_path
      end
    end
  end

  def edit
    authorize @pick
    @user = @pick.user
    @product = @pick.campaign.product
  end

  private

  def set_pick
    @pick = Pick.find(params[:id])
  end

  def pick_params_ab
    params.require(:pick).permit(:answer).reject { |_, v| v.blank? }
  end

  def pick_params_open
    params.require(:pick).permit(:price).merge(answer: "Yes").reject { |_, v| v.blank? }
  end

end
