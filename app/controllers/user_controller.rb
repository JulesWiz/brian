class UserController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    # @user.save
    if @user.save
      log_user_in(@user, "You have successfully signed up!")
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :email, :password, :password_confirmation, forms_attributes: [:id, :name, :message, :relationship, :year, :image])
  end

end