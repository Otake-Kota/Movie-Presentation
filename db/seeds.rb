# 血液型
blood_types = ["A", "B", "AB", "O"]
blood_types.map { |blood_type|  BloodType.create!(name: blood_type) }


# 性別
genders = ["男", "女", "その他"]
genders.map { |gender|  Gender.create!(name: gender) }


# adminユーザー
User.create!(name:  "Example User",
             email: "example@example.com",
                         password: "password",
            password_confirmation: "password",
                        gender_id: 1,
                    blood_type_id: 1,
                         birthday: "1999-08-04",
                          comment: "よろしくお願いします。",
                            admin: true,
                        activated: true,
                     activated_at: Time.zone.now)

# ユーザー
50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
                           gender_id: 1,
                       blood_type_id: 2,
                            birthday: "1999-01-01",
                             comment: "映画が好きです",
                           activated: true,
                        activated_at: Time.zone.now)
end


# カテゴリー
categories = ["コメディー", "SF",         "アクション", "恋愛",     "サスペンス",
              "スリラー",   "ミステリー",  "ホラー",     "スポーツ", "青春",
              "ファミリー", "ミュージカル", "成人"]
categories.map { |category|  Category.create!(name: category) }


# 投稿映画
users = User.order(:created_at).take(5)
s1 = Date.parse("2010/01/01")
s2 = Date.parse("2020/10/05")
category_id = categories.length
5.times do
  content = Faker::Lorem.sentence(10)
  screening_date = Random.rand(s1 .. s2)
  name = Faker::Lorem.sentence(1)
  users.each { |user| user.movies.create!(name: name,
                                       content: content,
                                screening_date: screening_date,
                                       spoiler: rand(0 .. 1),
                                   category_id: rand(1 .. category_id),
                                   movie_maxim: name)}
end


# イイね
users = User.all.take(5)
(6 .. 10).each.with_index(1) do |num, i|
  users.each { |user| user.likes.create!(movie_id: num + i) }
end


# フォロー、フォロワー
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
