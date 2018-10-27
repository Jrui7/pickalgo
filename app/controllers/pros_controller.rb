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

  def update_password
    @pro = current_pro
    authorize @pro
    if @pro.update_with_password(pro_password_params)
      # Sign in the pro by passing validation in case their password changed
      bypass_sign_in(@pro)
      respond_to do |format|
        format.html {redirect_to edit_pro_path(@pro)}
        format.js
      end
      flash[:info] = "Mot de passe actualisé"
    else
      flash[:alert] = "Erreur, mot de passe inchangé"
      render :edit
    end
  end

  private

  def pro_params
    params.require(:pro).permit(:brand, :contact_person, :email, :facebook, :insta, :youtube, :twitter, :phone)
  end

  def pro_password_params
    params.require(:pro).permit(:current_password, :password, :password_confirmation)
  end

end
