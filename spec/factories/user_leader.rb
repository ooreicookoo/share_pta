FactoryBot.define do

  factory :user_leader, class: User do
    name { 'リーダーユーザー' }
      email { 'leader@gmail.com' }
      password { 'password' }
      password_confirmation　{ 'password' }
      school_year {'5'}
      school_class {'3'}
      charge {'リーダー'}
      admin {'false'}
      leader {'true'}
      confirmed_at {'Date.today'}
  end
end
