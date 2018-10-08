class UsersController < ApplicationController
  def show
    @user = User.friendly.find(params[:id])
    authorize @user
  end

  def update
    @user = User.friendly.find(params[:id])
    @user.slug = nil
    authorize @user
    if @user.update(user_params)
      respond_to do |format|
        format.html {redirect_to user_path(@user)}
        format.js
      end
      @user.friendly_id
    end

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end
