class PasswordResetter

  SUCCESS = "We'll send you an email with instrutions for resetting"
  USER_NOT_FOUND = "Unable to log you in. Please check your Email and Password again "
  MAIL_FAILED = "Unable to send email. Please notify webmaster"
  SAVE_FAILED = "Password reset failed. Please notify webmaster"

  def initialize(flash)
    @flash = flash
  end

  def handle_reset_request(params)
    if @user = User.find_by(email: params[:email])
      update_user_and_send_email
    else
      @flash.now[:alert] = USER_NOT_FOUND
    end
  end

  def update_password(user, params)
    if user.reset_password( params )
      UserNotifier.password_was_reset( user ).deliver
      return true
    end
  end

  private

  def update_user_and_send_email
    if @user.set_password_reset
      send_reset_email
    else
      @flash.now[:alert] = SAVE_FAILED
    end
  end

  def send_reset_email
    begin
      UserNotifier.reset_password(@user).deliver
      @flash.now[:notice] = SUCCESS
    rescue
      @flash.now[:alert] = MAIL_FAILED
    end
  end

end

