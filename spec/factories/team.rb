# 「FactoryBotを使用します」という記述
FactoryBot.define do

  factory :team do
    name { '最初のチーム名' }
    owner_id { 'FactoryBot.create(:user).id' } 
    user
  end

  # factory :second_team, class: Team do
  #   name { 'Factoryで作ったテストネーム2' }
  #   owner { FactoryBot.create(:owner) }
  #   association :user, factory: :user_leader
  # end
  #
  # factory :third_team, class: Team do
  #   name { 'Factoryで作ったテストネーム3' }
  #   owner { FactoryBot.create(:owner) }
  #   user
  # end
end

#チームはアドミンとリーダーしか作成出来ない
