class ProsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_pro!
  def show
    pro = current_pro.id
    @pro = Pro.friendly.find(pro)
    authorize @pro
  end

  def update
    @pro = Pro.friendly.find(params[:id])

    authorize @pro
    if @pro.update(pro_params)
      respond_to do |format|
        format.html {redirect_to pro_path(@pro)}
        format.js
      end
    end
  end

  def edit
    @pro = Pro.friendly.find(params[:id])
    authorize @pro
  end

  def pro_params
    params.require(:pro).permit(:brand, :contact_person, :email, :facebook, :insta, :youtube, :twitter, :phone)
  end

end
