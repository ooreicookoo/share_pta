FactoryBot.define do
  factory :user do
    name { 'テストアドミンユーザー' }
    email { 'admin@gmail.com' }
    # sequence(:email) { |n| "admin#{n}@gmail.com" }
    password { 'password' }
    school_year {'6'}
    school_class {'1'}
    confirmed_at { Date.today }
  end
  # factory :user do
  #   name { '一般ユーザー' }
  #   email { 'federico_stehr@goyette-hauck.co' }
  #   password { 'password' }
  #   password_confirmation　{ 'password' }
  #   school_year {'5'}
  #   school_class {'3'}
  #   charge {'リーダー'}
  #   admin {'false'}
  #   leader {'true'}
  #   confirmed_at {'Date.today'}
  # end
end
