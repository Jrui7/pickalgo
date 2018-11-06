class ReservationsController < ApplicationController
  before_action :set_pick, only: [:new]
  skip_after_action :verify_authorized


  def new
    @user = current_user
    @user.address.present? ? @address = @user.address : @address = Address.new
    unless @user.customer_id.blank?
      @customer_infos = Stripe::Customer.retrieve(@user.customer_id).sources.data[0]
    end
  end


  private

    def set_pick
      @pick = Pick.where.not(answer: [nil, ""]).find(params[:pick_id])
    end


end
