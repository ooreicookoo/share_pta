FactoryBot.define do
  factory :report do
    title { 'test_report_title' }
    content { 'test_report_content' }
    time { '2.5' }
    date { '2020-09-14 00:00:00' }
    place { 'test_report_place' }
    user_id {
      (
        User.find_by(email: FactoryBot.build(:user).email) || FactoryBot.create(:user)
      ).id
    }
    team_id {
      (
        Team.find_by(name: FactoryBot.build(:leader_team).name) || FactoryBot.create(:leader_team)
      ).id
    }
  end
end
