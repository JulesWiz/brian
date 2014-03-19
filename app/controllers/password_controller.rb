class PasswordController < ApplicationController

LINK_EXPIRED = "Your reset link has expired, please generate a new one"

  def edit
    unless @user = User.find_by_code( params[:code] )
    redirect_to login_url, notice: LINK_EXPIRED
  end

  def update
    if @user = User.find_by_code( params[:code] )
    # if user is found
      if params[:user][:password].blank?
        @user.errors.add(:password, "can't be blank.")
        flash.now[:alert] = @user.errors
        render :edit
      elsif @user.reset_password( user_params )
        session[:user_id] = @user.id
        redirect_to root_url, notice: "You have successfully reset your password."
      else
        flash.now[:alert] : @user.errors
        render :edit
      end
    # otherwise show a message not found
    else
      render text: "No code found"
    end
  end

  #   if @user.update user_params
  #     render text: "Success"
  #   else
  #     render text: "Oops"
  #   end
  # end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end