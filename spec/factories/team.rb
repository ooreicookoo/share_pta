FactoryBot.define do

  factory :team do
    # name { '最初のチーム名_by_admin2' }
    sequence(:name) { |n| "最初のチーム名_by_admin2#{n}" }
    # owner_id { '1' } #アドミンのオーナーID
    owner_id { User.find_by(admin: true).id}
    # # user { FactoryBot.create :admin_user }
    # sequence(:user) { |n| "User.find_by(admin: true)#{n}.id" }
    # association :user, factory: :admin_user
  end

  # factory :team do
  #   name { '最初のチーム名_by_leader' }
  #   owner_id { '2' } #リーダーのオーナーID
  #   # # user { FactoryBot.create :admin_user }
  #   # sequence(:user) { |n| "User.find_by(admin: true)#{n}.id" }
  #   # association :user, factory: :admin_user
  # end



  # factory :second_team do
  #   name { '最初のチーム名_by_leader' }
  #   admin {'true'}
  #   leader {'false'}
  #   owner_id { User.find_by(leader: true).id }
  #   association :user, factory: :leader_user
  # end

  # factory :third_team, class: Team do
  #   name { 'Factoryで作ったテストネーム3' }
  #   owner { FactoryBot.create(:owner) }
  #   user
  # end
end

#チームはアドミンとリーダーしか作成出来ない
