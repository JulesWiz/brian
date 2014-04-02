class UserNotifier < ActionMailer::Base

  CODED_RESET_LINK_SUBJECT = "[BriannFishy] Reset your credentials"
  PASSWORD_WAS_RESET_SUBJECT = "[BriannFishy] Your password was reset successfully"

  default from: "BriannFishy <webmaster@briannfishy.com"

  def coded_password_reset_link(user)
    @user = user
    mail to: @user.email, subject: CODED_RESET_LINK_SUBJECT
  end

  def password_was_reset(user)
    @user = user
    mail to: @user.email, subject: PASSWORD_WAS_RESET_SUBJECT
  end
end