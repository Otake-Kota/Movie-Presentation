class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subkect: "Account activation"
  end

  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end