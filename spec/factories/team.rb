FactoryBot.define do

  #アドミンの作成したチーム
  factory :admin_team, class: Team do
    sequence(:name) { |n| "最初のチーム名_by_admin#{n}" }
    # owner_id { '1' } #アドミンのオーナーID
    owner_id { User.find_by(admin: true).id}
    # # user { FactoryBot.create :admin_user }
    # sequence(:user) { |n| "User.find_by(admin: true)#{n}.id" }
    # association :user, factory: :admin_user
  end

  #リーダーの作成したチーム
  factory :leader_team, class: Team do
    sequence(:name) { |n| "最初のチーム名_by_leader#{n}" }
    # owner_id { '1' } #アドミンのオーナーID
    owner_id { User.find_by(leader: true).id}
    # # user { FactoryBot.create :admin_user }
    # sequence(:user) { |n| "User.find_by(admin: true)#{n}.id" }
    # association :user, factory: :admin_user
  end
end
