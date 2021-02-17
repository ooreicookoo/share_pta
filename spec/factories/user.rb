FactoryBot.define do

  factory :user_admin do
    name { 'テストアドミンユーザー' }
    email { 'admin@gmail.com' }
    password { 'password' }
    password_confirmation　{ 'password' }
    school_year {'6'}
    school_class {'1'}
    charge {'アプリ管理'}
    admin {'true'}
    leader {'true'}
    confirmed_at {'Date.today'}
  end

  # factory :user_leader do
  #   name { 'テストリーダーユーザー' }
  #   email { 'leader@gmail.com' }
  #   password { 'password' }
  #   password_confirmation　{ 'password' }
  #   school_year: {'5'}
  #   school_class: {'3'}
  #   charge: {'PTA会長'}
  #   admin: {'false'}
  #   leader: {'true'}
  #   confirmed_at: {'Date.today'}
  # end
  #
  # factory :user_leader do
  #   name { 'テストリーダーユーザー' }
  #   email { 'leader@gmail.com' }
  #   password { 'password' }
  #   password_confirmation　{ 'password' }
  #   school_year: {'5'}
  #   school_class: {'3'}
  #   charge: {'PTA会長'}
  #   admin: {'false'}
  #   leader: {'true'}
  #   confirmed_at: {'Date.today'}
  # end
end
