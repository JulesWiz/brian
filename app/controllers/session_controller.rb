class SessionController < ApplicationController

  def new
    # @messages = flash.inspect
    # @messages = flash.map{|key,value| "#{key.capitalize}: #{value}"}.join(";")
  end

  def create
    # render text: "Log #{params[:user][:email]} in with #{params[:user][:password]}."
    @user = User.authenticate(params[:user][:email], params[:user][:password])

    if @user
      session[:user_id] = @user.id
      # render text: "Welcome #{@user.email}"
      redirect_to root_url
    else
      # render text: "Who are you?"
      # redirect_to login_url
      flash.now[:alert] = "Unable to log you in. Please check your email address and password and sign in again."
      render :new
    end

  end

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