class UserAuthenticator

  AUTH_FAILED = %{
    Unable to log you into the system, please try again
  }.squish

  def initialize(session, flash)
    @flash = flash
    @session = session
  end

  def authenticate_user(user_params)
    #email and password
    unless @user = User.authenticate(
      user_params[:email],
      user_params[:password])
      @flash.now[:alert] = AUTH_FAILED
    end

    @user

  end


end