class UserNotifier < ActionMailer::Base

  default from: "BriannFishy <webmaster@briannfishy.com"

  def reset_password(user)
    @user = user
    mail to: @user.email, subject: "[BriannFishy] Reset your credentials"
  end

  def password_was_reset(user)
  end
end