class ProsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_pro!
  before_action :set_page_params, only: [:show, :edit]

  def show
    @pro = Pro.friendly.find(params[:id])
    authorize @pro
  end

  def update
    @pro = Pro.friendly.find(params[:id])
    authorize @pro
    if @pro.update(pro_params)
      redirect_to pro_path(@pro) , :flash => { :notice => "Modification enregistrée" }
    else
      render :show
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
      flash[:notice] = "Mot de passe actualisé"
      redirect_to edit_pro_path(@pro)
    else
      flash[:alert] = "Erreur, mot de passe inchangé"
      render :edit
    end
  end

  def my_campaigns
    @pro = Pro.friendly.find(params[:id])
    authorize @pro
    @campaigns = @pro.campaigns
    @page = "campaigns"
  end

  def pundit_user
    Pro.friendly.find(params[:id])
  end

  private

  def pro_params
    params.require(:pro).permit(:brand, :contact_person, :email, :facebook, :insta, :youtube, :twitter, :phone, :bio)
  end

  def pro_password_params
    params.require(:pro).permit(:current_password, :password, :password_confirmation)
  end

  def set_page_params
    @page = params["action"]
  end

end
