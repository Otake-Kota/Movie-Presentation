BloodType.create!(name: "A")
BloodType.create!(name: "B")
BloodType.create!(name: "AB")
BloodType.create!(name: "O")
Gender.create!(name: "男")
Gender.create!(name: "女")
Gender.create!(name: "その他")

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
