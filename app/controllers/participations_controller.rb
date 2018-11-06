class ParticipationsController < ApplicationController
  before_action :set_pick, only: [:new]
  skip_after_action :verify_authorized


  def new
    @user = current_user
    @user.address.present? ? @address = @user.address : @address = Address.new
  end


  private

    def set_pick
      @pick = Pick.where.not(answer: [nil, ""]).find(params[:pick_id])
    end


end
