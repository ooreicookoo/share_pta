FactoryBot.define do

  factory :admin_user, class: User do
    name { 'テストアドミンユーザー' }
    email { 'admin@gmail.com' }
    # sequence(:email) { |n| "admin#{n}@gmail.com" }
    admin {'true'}
    leader {'true'}
    password { 'password' }
    school_year {'6'}
    school_class {'1'}
    confirmed_at { Date.today }
  end

  factory :leader_user, class: User do
    name { 'テストリーダーユーザー' }
    email { 'leader@gmail.com' }
    # sequence(:email) { |n| "leader#{n}@gmail.com" }
    admin {'false'}
    leader {'true'}
    password { 'password' }
    school_year {'5'}
    school_class {'3'}
    confirmed_at { Date.today }
  end

  factory :user, class: User do
    name { 'テストユーザー' }
    email { 'federico_stehr@goyette-hauck.co' }
    admin {'false'}
    leader {'false'}
    password { 'password' }
    school_year {'2'}
    school_class {'2'}
    confirmed_at { Date.today }
  end
end
