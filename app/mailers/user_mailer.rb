class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subkect: "Account activation"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end

  def recomend_movies(user)
    @user = user
    @movies = Movie.order('created_at desc').limit(5)
    mail to: user.email, subject: "今週のオススメの映画情報"
  end
end
