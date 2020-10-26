namespace :mail do
  desc "定期的にメールを送る"
  task recomend_movies: :environment do
    users = User.all.limit(1)
    users.each do |user|
      UserMailer.recomend_movies(user).deliver_now
    end
  end
end
