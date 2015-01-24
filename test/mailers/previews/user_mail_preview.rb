# Preview all emails at http://localhost:3000/rails/mailers/user_mail
class UserMailPreview < ActionMailer::Preview
  def welcome
    user = User.first
    UserMail.welcome(user)
  end

  def confirm_email
    user = User.first
    UserMail.confirm_email(user)
  end
end
