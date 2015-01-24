class UserMail < ActionMailer::Base
  default from: "光谷客 <no-reply@startups-coffee.com>"

  def welcome(user)
    @user = user
    mail to: @user.email, subject: '光谷客恭候您多时了'
  end

  def confirm_email(user)
    @user = user
    @user.update_attributes(confirmation_sent_at: Time.now, confirmation_token: SecureRandom.urlsafe_base64(10))
    mail to: @user.email, subject: '光谷客邮箱验证'
  end
end
