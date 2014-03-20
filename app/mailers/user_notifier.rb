class UserNotifier < ActionMailer::Base

  LINK_TO_RESET = "[BriannFishy] Reset your credentials"
  WAS_RESET = "[BriannFishy] Your password was reset successfully"

  default from: "BriannFishy <webmaster@briannfishy.com"

  def reset_password(user)
    @user = user
    mail to: @user.email, subject: LINK_TO_RESET
  end

  def password_was_reset(user)
    @user = user
    mail to: @user.email, subject: WAS_RESET
  end
end