class AuthenticateUser

  AUTH_FAILED = "Unable to log you into the system, please try again"

  def initialize(session, flash)
    @flash = flash
    @session = session
  end

  def handle_authenticate_user(params)
    @flash.now[:alert] = AUTH_FAILED unless @user = User.authenticate(params[:email], params[:password])
    @user
  end

end