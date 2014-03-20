class SessionController < ApplicationController

  def new
    # @messages = flash.inspect
    # @messages = flash.map{|key,value| "#{key.capitalize}: #{value}"}.join(";")
    redirect_to root_url, notice: "You are logged in." if current_user
  end

  def create
    user = User.find_by(email: params[:user][:email])
    password = params[:user][:password]

    if user
      if password.blank?
        #password reset
        PasswordResetter.new(flash).handle_password_reset(user_params)
        render :new
      else
        #authenticate
        log_user_in( AuthenticateUser.new(session, flash).handle_authenticate_user(user_params) )
        redirect_to root_url
      end
    else
      # error msg :user not exists
      flash[:alert]= "email and password wrong !"
      render :new
    end

  end

  def destroy
    log_user_out
    # render text: "Log the user out."
    redirect_to login_url, notice: "You've successfully logout!"
  end

  def form
  end

  def formcreate
    render json: User.all.entries
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end

