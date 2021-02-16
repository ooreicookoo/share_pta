User.create!(
   name: '管理者',
   email: 'admin@gmail.com',
   password: 'password',
   password_confirmation: "password",
   school_year: '6',
   school_class: '1',
   charge: 'アプリ管理',
   admin: 'true',
   leader: 'true',
   confirmed_at: Date.today
)

User.create!(
  name: 'リーダー',
  email: 'leader@gmail.com',
  password: 'password',
  password_confirmation: "password",
  school_year: '5',
  school_class: '3',
  charge: 'PTA会長',
  admin: 'false',
  leader: 'true',
  confirmed_at: Date.today
)

20.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  password_confirmation = "password_confirmation"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    school_year: 2,
    school_class: 2,
    charge: '学級',
    admin: false,
    leader: false,
    confirmed_at: Date.today
  )
end



10.times do |k|
  Team.create!(
    name:"leader-桃三小学校チーム#{k + 1}",
    owner_id: User.find_by(leader: true).id
  )
end

10.times do |k|
  Team.create!(
    name:"admin-桃三小学校チーム#{k + 1}",
    owner_id: User.find_by(admin: true).id
  )
end

10.times do |k|
  Assign.create!(
    user_id: User.first.id + k,
    team_id: Team.first.id + k
  )
end

20.times do |k|
  Report.create!(
    title:"report#{k + 1}",
    content: "content#{k + 1}",
    time: '2.5',
    date: '2020-09-14 00:00:00',
    place: '学校',
    image: open("#{Rails.root}/db/fixtures/image#{k}.png"),
    user_id: User.first.id + k,
    team_id: Team.first.id + k
  )
end

20.times do |k|
  ReportComment.create!(
    comment_content:"comment_content#{k + 1}",
    report_id: Report.first.id + k
  )
end
