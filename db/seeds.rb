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
              "ファミリー", "ミュージカル", "成人", "戦争"]
categories.map { |category|  Category.create!(name: category) }


# 投稿映画
s1 = Date.parse("2010/01/01")
s2 = Date.parse("2020/10/05")
category_id = categories.length

first_user = User.find(1)
screening_date = Random.rand(s1 .. s2)
first_user.movies.create!(name: "進撃の巨人",
                       content: "人類は突如出現した「巨人」により滅亡の淵に立たされた。生き残った人類は「ウォール・マリア」、「ウォール・ローゼ」、「ウォール・シーナ」という巨大な三重の城壁（甕城）の内側に生活圏を確保することで100年の間、辛うじてその命脈を保っていた。",
                screening_date: screening_date,
                       spoiler: rand(0 .. 1),
                   category_id: rand(1 .. category_id),
                   movie_maxim: "駆逐してやる")

first_user.movies.create!(name: "ヴァイオレット・エヴァーガーデン",
                       content: "4年間にわたる東西南北による大陸戦争が終結。
                       その戦場で「武器」と称されて戦うことしか知らなかった少女・ヴァイオレット・エヴァーガーデンは、激化する戦場で両腕を失い、自在に動く義手を付けることを余儀なくされる。
退院したヴァイオレットは、ホッジンズの下で、自動手記人形としてC.H郵便社で働きはじめる。
ヴァイオレットには、かつて戦場で誰よりも大切な人・ギルベルト少佐がいた。最後に聞かされた「愛してる」という言葉が理解できなかった彼女は、仕事と日常を通じて人と触れ合いながら、その言葉の意味を探していく",
                screening_date: screening_date,
                       spoiler: rand(0 .. 1),
                   category_id: 4,
                   movie_maxim: "人には届けたい想いがあるのです")

first_user.movies.create!(name: "タイタニック",
                       content: "1912年に実際に起きた英国客船タイタニック号沈没事故を基に、貧しい青年と上流階級の娘の悲恋を描いている。主にSFアクション映画を手掛けてきたキャメロン監督が、一転して挑んだラブロマンス大作である。
                       タイタニック号沈没の史実を架空のラブストーリーを交えて展開される。前半のラブストーリーから一転して、後半ではパニック映画さながらの緊迫感のある展開で、ラストは悲劇的な別れとなる恋人たちが描かれている。",
                screening_date: screening_date,
                       spoiler: rand(0 .. 1),
                   category_id: 4,
                   movie_maxim: "船のきっぷは、僕の人生にとって最高の送りものだった。君に会えたからね。")

first_user.movies.create!(name: "南極物語",
                       content: "南極大陸に残された兄弟犬タロとジロと越冬隊員が1年後に再会する実話を元に創作を交え、北極ロケを中心に少人数での南極ロケも実施し、撮影期間3年余をかけ描いた大作映画である。",
                screening_date: screening_date,
                       spoiler: rand(0 .. 1),
                   category_id: 11,
                   movie_maxim: "どうして見捨てたのですか")

first_user.movies.create!(name: "永遠の0",
                       content: "大学生の佐伯健太郎と、出版社に勤める姉の慶子は、亡くなった祖母・松乃の四十九日から暫くした頃、祖父・賢一郎から彼が自分達の実の祖父ではないことを知らされる。第二次世界大戦後、松乃は二人の母・清子を連れて賢一郎と再婚しており、実の祖父は終戦間際に特攻で戦死した海軍航空兵だと判明する。",
                screening_date: screening_date,
                       spoiler: rand(0 .. 1),
                   category_id: 14,
                   movie_maxim: "わたしにとって生きて帰ることは、なによりも大事なことなのです。")
                   
users = User.where.not(id: 1).order(:created_at).take(5)
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
