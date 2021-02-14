# 30.times do |n|
#   name = Faker::Games::Pokemon.name
#   email = Faker::Internet.email
#   password = "password"
#   User.create!(email: email,
#                password: password,
#                password_confirmation: password,
#                )
# end


20.times do |k|
  Report.create!(
  title:"report#{k + 1}",
  content: "content#{k + 1}",
  time: '2.5',
  date: '2020-09-14 00:00:00',
  place: '学校',
  image: '学校',
  user_id: User.first.id + k
  )
end

User.create!(name: '管理者',
               email: 'admin@gmail.com',
               password: 'password',
               password_confirmation: "password",
               school_year: '1',
               school_class: '1',
               charge: '代表',
               admin: 'true'
          
               )
