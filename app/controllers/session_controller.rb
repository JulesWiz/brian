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
        PasswordResetter.new(flash).handle_password_reset(user)
        render :new
      else
        #authenticate
        AuthenticateUser.new(session, flash).handle_authenticate_user(user)
        redirect_to root_url
      end
    else
      # error msg :user not exists
      flash[:alert]= "email and password wrong !"
      render :new
    end

  end

  # def create
  #   # render text: "Log #{params[:user][:email]} in with #{params[:user][:password]}."
  #   # @user = User.authenticate(params[:user][:email], params[:user][:password])
  #   user = User.find_by(email: params[:user][:email])
  #   password = params[:user][:password]

  #   if user and password.blank?
  #     # render text: "Time to reset password"
  #     user.set_password_reset
  #     UserNotifier.reset_password(user).deliver
  #     flash.now[:notice] = "We are sending you an email for you to reset your password."
  #     render :new
  #   elsif user and user.authenticate(password)
  #     session[:user_id] = user.id
  #     # render text: "Welcome #{@user.email}"
  #     redirect_to root_url
  #   else
  #     # render text: "Who are you?"
  #     # redirect_to login_url
  #     flash.now[:alert] = "Unable to log you in. Please check your email address and password and sign in again."
  #     render :new
  #   end

  # end

  def destroy
    session[:user_id] = nil
    # render text: "Log the user out."
    redirect_to login_url, notice: "You've succssfully logout!"
  end

  def form
  end

  def formcreate
    render json: User.all.entries
  end


end