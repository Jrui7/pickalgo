class ProsController < ApplicationController
  before_action :set_pick, only: [:update]


  def update
    @pick.update(pick_params)
    authorize @pick
    if @pick.update(pick_params)
    end
  end

  private

  def set_pick
    @pick = Pick.find(params[:id])
  end

  def pick_params
    params.require(:pick).permit(:price, :answer)
  end

end
