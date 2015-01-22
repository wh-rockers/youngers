class UserMail < ActionMailer::Base
  default from: "光谷客 <zilongji@gmail.com>"

  def welcome
    mail to: 'zilongjiweixin@gmail.com', subject: 'Welcome to PathSource!'
  end
end
