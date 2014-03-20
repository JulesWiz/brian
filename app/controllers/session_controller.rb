class SessionController < ApplicationController

  def new
    # @messages = flash.inspect
    # @messages = flash.map{|key,value| "#{key.capitalize}: #{value}"}.join(";")
    redirect_to root_url, notice: "You are logged in." if current_user
  end

  def create
    if params[:user][:password].blank?
      #password reset
      PasswordResetter.new(flash).handle_reset_request(user_params)
    else
      #authenticate
      return if log_user_in( UserAuthenticator.new(session, flash).handle_authenticate_user(user_params) )
    end
    # (redirect_to root_url and return) if flash.empty?
    render :new
  end

  def destroy
    log_user_out
    # render text: "Log the user out."
    # redirect_to login_url, notice: "You've successfully logout!"
  end

  # def form
  # end

  # def formcreate
  #   render json: User.all.entries
  # end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end

