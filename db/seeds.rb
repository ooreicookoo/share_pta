30.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               )
end

# 20.times do |k|
#   Report.create!(
#   title:"report#{k + 1}",
#   content: "content#{k + 1}",
#   content: "content#{k + 1}",
#   time: '2.5',
#   date: '2020-09-14 00:00:00',
#   place: '学校',
#   user_id: User.first.id + k
#   )
# end
