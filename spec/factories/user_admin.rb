FactoryBot.define do

  factory :user_admin, class: User do
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
  #   charge: {'リーダー'}
  #   admin: {'false'}
  #   leader: {'true'}
  #   confirmed_at: {'Date.today'}
  # end
  #
  # factory :user do
  #   name { 'テストユーザー' }
  #   email { 'federico_stehr@goyette-hauck.co' }
  #   password { 'password' }
  #   password_confirmation　{ 'password' }
  #   school_year: {'5'}
  #   school_class: {'3'}
  #   charge: {'リーダー'}
  #   admin: {'false'}
  #   leader: {'true'}
  #   confirmed_at: {'Date.today'}
  # end
end
