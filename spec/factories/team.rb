# 「FactoryBotを使用します」という記述
FactoryBot.define do
  # 作成するテストデータの名前を「task」とします
  # （実際に存在するクラス名と一致するテストデータの名前をつければ、そのクラスのテストデータを自動で作成します）
  factory :team do
    name { 'Factoryで作ったテストネーム' }
    owner { FactoryBot.create(:owner) }
    association :user, factory: :user_admin
  end
  # 作成するテストデータの名前を「second_task」とします
  # （存在しないクラス名の名前をつける場合、オプションで「このクラスのテストデータにしてください」と指定します）
  factory :second_team, class: Team do
    name { 'Factoryで作ったテストネーム2' }
    owner { FactoryBot.create(:owner) }
    association :user, factory: :user_leader
  end
  factory :third_team, class: Team do
    name { 'Factoryで作ったテストネーム3' }
    owner { FactoryBot.create(:owner) }
    user
  end
end

#チームはアドミンとリーダーしか作成出来ない
