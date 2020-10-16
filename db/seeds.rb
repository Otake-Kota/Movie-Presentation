blood_types = ["A", "B", "AB", "O"]
blood_types.map { |blood_type|  BloodType.create!(name: blood_type) }


genders = ["男", "女", "その他"]
genders.map { |gender|  Gender.create!(name: gender) }


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

99.times do |n|
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


prefectures = ["北海道",   "青森県", "岩手県", "宮城県",   "秋田県",
               "山形県",   "福島県", "茨城県", "栃木県",   "群馬県",
               "埼玉県",   "千葉県", "東京都", "神奈川県", "新潟県",
               "富山県",   "石川県", "福井県", "山形県",   "長野県",
               "岐阜県",   "静岡県", "愛知県", "三重県",   "滋賀県",
               "京都府",   "大阪府", "兵庫県", "奈良県",   "和歌山県",
               "鳥取県",   "島根県", "岡山県", "広島県",   "山口県",
               "徳島県",   "香川県", "愛媛県", "高知県",   "福岡県",
               "佐賀県",   "長崎県", "熊本県", "大分県",   "宮崎県",
               "鹿児島県", "沖縄県"]
prefectures.map { |prefecture|  Prefecture.create!(name: prefecture) }


professions = ["アイドル", "アナウンサー",      "歌手",          "お笑い芸人", "声優",
               "タレント", "ファッションモデル", "ユーチューバー",  "ラッパー",  "レースクイーン"]
professions.map { |profession|  Prefecture.create!(name: profession) }


categories = ["コメディー", "SF",         "アクション", "恋愛",     "サスペンス",
              "スリラー",   "ミステリー",  "ホラー",     "スポーツ", "青春",
              "ファミリー", "ミュージカル", "成人"]
categories.map { |category|  Category.create!(name: category) }


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

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
