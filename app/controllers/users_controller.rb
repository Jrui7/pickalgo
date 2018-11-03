class UsersController < ApplicationController
  before_action :set_page, only: [:show, :edit]
  def show
    @user = User.friendly.find(params[:id])
    authorize @user
  end

  def edit
    @user = User.friendly.find(params[:id])
    authorize @user
  end

  def update
    @user = User.friendly.find(params[:id])
    @user.slug = nil
    authorize @user
    if @user.update(user_params)
      flash[:notice] = "Informations actualisées"
      redirect_to user_path(@user)
      # @user.friendly_id
    else
      render :show
    end
  end

  def update_password
    @user = current_user
    authorize @user
    if @user.update_with_password(user_password_params)
      # Sign in the pro by passing validation in case their password changed
      bypass_sign_in(@user)
      flash[:notice] = "Mot de passe actualisé"
      redirect_to edit_user_path(@user)
    else
      flash[:alert] = "Erreur, mot de passe inchangé"
      render :edit
    end
  end

  def my_campaigns
    @user = current_user
    authorize @user
    @picks = Pick.where(user: @user).where.not(answer: [nil, ""])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone, :date_of_birth, :sex)
  end

  def user_password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end

  def set_page
    @page = params["action"]
  end

end
